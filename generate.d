#!/usr/bin/env rdmd

import std;

void main(string[] args)
{
	string[] unions = [];
	int unionCounter;

	auto api = parseJSON(readText("openvr_api_docs.json"));
	auto output = File("source/openvr/api.d", "w");
	output.writeln("//");
	output.writeln("// THIS FILE IS AUTO GENERATED");
	output.writeln("//    DO NOT MANUALLY EDIT!");
	output.writeln("//");
	output.writeln("/// Automatically generated C++ API bindings");
	output.writeln("module openvr.api;");
	output.writeln("");
	output.writeln("import openvr.vk_stub;");
	output.writeln("import openvr.dx_stub;");
	output.writeln("");
	output.writeln("extern(C++, vr):");
	output.writeln("");

	void writelnWithDocs(string s, JSONValue entry, bool inline)
	{
		string indent = s[0 .. $ - s.stripLeft.length];
		if (auto docs = "doc" in entry)
		{
			auto d = docs.str.split("\n");
			if (d.length == 1)
			{
				if (inline)
				{
					output.writeln(s, " /// ", d[0]);
				}
				else
				{
					output.writeln(indent, "/// ", d[0]);
					output.writeln(s);
				}
			}
			else
			{
				foreach (ln; d)
					output.writeln(indent, "/// ", ln);
				output.writeln(s);
			}
		}
		else
		{
			if (inline)
			{
				output.writeln(s, " ///");
			}
			else
			{
				output.writeln(indent, "///");
				output.writeln(s);
			}
		}
	}

	foreach (entry; api["typedefs"].array)
	{
		if (entry["type"].str.startsWith("union "))
		{
			unions ~= entry["type"].str.convertType;
			continue;
		}

		writelnWithDocs(format!"alias %s = %s;"(
			entry["typedef"].str.makeNamespaceName,
			entry["type"].str.convertType
		), entry, true);
	}
	output.writeln("");

	foreach (entry; api["enums"].array)
	{
		string name = entry["enumname"].str.makeEnumName;
		writelnWithDocs("enum " ~ name, entry, false);
		output.writeln("{");
		foreach (value; entry["values"].array)
		{
			writelnWithDocs(format!"\t%s = %s,"(
				value["name"].str.stripEnumMemberName(name),
				value["value"].str
			), entry, true);
		}
		output.writeln("}");
		output.writeln("");
	}

	foreach (entry; api["consts"].array)
	{
		string type = entry["consttype"].str
			.convertConstType;

		if (type == "string")
		{
			writelnWithDocs(format!"enum %s_s = %s;"(
				entry["constname"].str.convertIdentifier,
				entry["constval"].str.convertConstValue(type)
			), entry, true);
			writelnWithDocs(format!"enum const(char)* %s = %s_s.ptr;"(
				entry["constname"].str.convertIdentifier,
				entry["constname"].str.convertIdentifier
			), entry, true);
		}
		else
		{
			writelnWithDocs(format!"enum %s %s = %s;"(
				type,
				entry["constname"].str.convertIdentifier,
				entry["constval"].str.convertConstValue(type)
			), entry, true);
		}
	}
	output.writeln("");

	foreach (entry; api["structs"].array)
	{
		string name = entry["struct"].str.makeNamespaceName;
		if (name == "(anonymous)")
			writelnWithDocs("union " ~ unions[unionCounter++], entry, false);
		else
			writelnWithDocs("struct " ~ name, entry, false);
		output.writeln("{");
		foreach (value; entry["fields"].array)
		{
			string type = value["fieldtype"].str.convertType;
			if (type.startsWith("float", "double", "char"))
				writelnWithDocs(format!"\t%s %s = %s;"(
					type,
					value["fieldname"].str.convertIdentifier,
					generateZeroInit(type)
				), entry, true);
			else
				writelnWithDocs(format!"\t%s %s;"(
					type,
					value["fieldname"].str.convertIdentifier
				), entry, true);
		}
		output.writeln("}");
		output.writeln("");
	}

	string lastClass;
	foreach (entry; api["methods"].array)
	{
		string className = entry["classname"].str.makeNamespaceName;
		if (className != lastClass)
		{
			if (lastClass.length)
			{
				output.writeln("}");
				output.writeln("");
			}
			output.writeln("///");
			output.writeln("abstract class ", className);
			output.writeln("{");
			lastClass = className;
		}
		writelnWithDocs(format!"\t%s %s(%s);"(
			entry["returntype"].str.convertType,
			entry["methodname"].str.convertIdentifier,
			"params" !in entry ? "" : entry["params"].array
				.map!(a => format!"%s %s"(
					a["paramtype"].str.convertType,
					a["paramname"].str.convertIdentifier
				))
				.join(", ")
		), entry, true);
	}
	if (lastClass.length)
	{
		output.writeln("}");
		output.writeln("");
	}
}

string makeNamespaceName(string namespacedName)
{
	return namespacedName.chompPrefix("vr::").convertIdentifier;
}

string makeEnumName(string namespacedName)
{
	return namespacedName.chompPrefix("vr::").convertIdentifier;
}

string stripEnumMemberName(string name, string enumname)
{
	return name.chompPrefix(enumname.chompPrefix("E") ~ "_").convertIdentifier;
}

string convertConstType(string type)
{
	if (type == "const char *const" || type == "const char *")
		return "string";
	else
		return type.chompPrefix("const ").convertType;
}

string convertConstValue(string value, string type)
{
	if (type == "string")
		return format!`"%s"`(value);
	else
		return value;
}

string convertType(string type)
out(v)
{
	if (v.byDchar.any!(std.uni.isWhite))
	{
		stderr.writeln("invalid output ", v, " for input ", type);
	}
}
do
{
	switch (type)
	{
	case "uint64_t": return "ulong";
	case "int64_t": return "long";
	case "uint32_t": return "uint";
	case "int32_t": return "int";
	case "unsigned short":
	case "uint16_t": return "ushort";
	case "int16_t": return "short";
	case "uint8_t": return "ubyte";
	case "int8_t": return "byte";
	case "_Bool": return "bool";
	case "void *": return "void*";
	case "VkDevice_T *":
	case "VkPhysicalDevice_T *":
	case "VkInstance_T *":
	case "VkQueue_T *":
	case "ID3D12Resource *":
	case "ID3D12CommandQueue *":
		return type[0 .. $ - 2];
	default:
		if (type.startsWith("enum "))
		{
			return type["enum".length .. $].stripLeft.makeEnumName.convertType;
		}
		else if (type.startsWith("union "))
		{
			return type["union".length .. $].stripLeft.convertType;
		}
		else if (type.startsWith("struct "))
		{
			return type["struct".length .. $].stripLeft.convertType;
		}
		else if (type.startsWith("class ") && type.endsWith("*"))
		{
			return type["class".length .. $ - "*".length]
				.strip.convertType;
		}
		else
		{
			if (type.endsWith("*"))
			{
				return type[0 .. $ - 1].strip.convertType ~ "*";
			}
			else if (type.endsWith("]"))
			{
				auto start = type.indexOf('[');
				auto conv = type[0 .. start].strip.convertType;
				return conv ~ "[" ~ type[start + 1 .. $ - 1].split("][").retro.join("][") ~ "]";
			}
			else if (type.startsWith("const "))
			{
				return "const(" ~ type["const".length .. $].strip.convertType ~ ")";
			}
			else if (type.endsWith(" const"))
			{
				return "const(" ~ type[0 .. $ - "const".length].strip.convertType ~ ")";
			}
			else
			{
				return type.makeNamespaceName;
			}
		}
	}
}

string generateZeroInit(string type)
{
	if (type.endsWith("]"))
	{
		auto start = type.lastIndexOf("[");
		auto firstStart = type.indexOf("[");
		int dim = type[start + 1 .. $ - 1].to!int;
		auto ret = appender!string;
		auto nested = generateZeroInit(type[0 .. start]);
		if (firstStart == start && nested == "0")
			return "0";

		ret ~= "[";
		foreach (i; 0 .. dim)
		{
			if (i != 0)
				ret ~= ", ";
			ret ~= nested;
		}
		ret ~= "]";
		return ret.data;
	}
	return "0";
}

string convertIdentifier(string identifier)
{
	return identifier;
}
