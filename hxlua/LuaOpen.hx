package hxlua;

import hxlua.Types;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
extern class LuaOpen
{
	@:native('luaopen_base')
	static function base(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_coroutine')
	static function coroutine(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_table')
	static function table(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_io')
	static function io(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_os')
	static function os(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_string')
	static function string(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_utf8')
	static function utf8(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_math')
	static function math(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_debug')
	static function debug(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_package')
	static function package(L:cpp.Pointer<Lua_State>):Int;
}
