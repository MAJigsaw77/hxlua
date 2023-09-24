package hxlua;

#if !cpp
#error 'Lua supports only C++ target platforms.'
#end
import hxlua.Types;

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
extern class LuaOpen
{
	@:native('luaopen_base')
	static function base(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_coroutine')
	static function coroutine(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_table')
	static function table(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_io')
	static function io(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_os')
	static function os(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_string')
	static function string(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_utf8')
	static function utf8(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_math')
	static function math(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_debug')
	static function debug(L:cpp.RawPointer<Lua_State>):Int;

	@:native('luaopen_package')
	static function lpackage(L:cpp.RawPointer<Lua_State>):Int; /* lpackage because haxe can't use `package` as function name */
}
