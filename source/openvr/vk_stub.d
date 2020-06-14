/// Vulkan type stubs
module openvr.vk_stub;

// We could add optional dub dependencies here, but all dependencies just define
// these types as void* so we might as well just do this too.
//
// When a type-safe Vulkan library comes out we want to support it though.

alias VkDevice_T = void*;
alias VkPhysicalDevice_T = void*;
alias VkInstance_T = void*;
alias VkQueue_T = void*;
