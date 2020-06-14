/// DirectX 12 type stubs
module openvr.dx_stub;

version (Have_directx_d)
{
	public import directx.d3d12 : ID3D12Resource, ID3D12CommandQueue;
}
else version (Have_aurora_directx)
{
	public import aurora.directx.d3d12.d3d12 : ID3D12Resource, ID3D12CommandQueue;
}
else
{
	alias ID3D12Resource = void*;
	alias ID3D12CommandQueue = void*;
}
