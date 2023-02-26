package hxlua;

import hxlua.Types;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
@:unreflective
extern class LuaOpen
{
	@:native('LUA_VERSUFFIX')
	static var VERSUFFIX:String;

	@:native('LUA_COLIBNAME')
	static var COLIBNAME:String;

	@:native('LUA_TABLIBNAME')
	static var TABLIBNAME:String;

	@:native('LUA_IOLIBNAME')
	static var IOLIBNAME:String;

	@:native('LUA_OSLIBNAME')
	static var OSLIBNAME:String;

	@:native('LUA_STRLIBNAME')
	static var STRLIBNAME:String;

	@:native('LUA_UTF8LIBNAME')
	static var UTF8LIBNAME:String;

	@:native('LUA_MATHLIBNAME')
	static var MATHLIBNAME:String;

	@:native('LUA_DBLIBNAME')
	static var DBLIBNAME:String;

	@:native('LUA_LOADLIBNAME')
	static var LOADLIBNAME:String;

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
	static function debug(L:cpp.Pointer<Lua_State>):Int;

	@:native('luaopen_package')
	static function package(L:cpp.RawPointer<Lua_State>):Int;
}
