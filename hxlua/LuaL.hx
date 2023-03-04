package hxlua;

#if (!cpp && macro)
#error 'Lua supports only C++ target platforms.'
#end

import hxlua.Types;

@:include("lua.hpp")
@:keep
@:unreflective
extern class LuaL
{
	/* global table */
	@:native('::String(LUA_GNAME)')
	static var GNAME:String;

	/* extra error code for 'luaL_loadfilex' */
	@:native('LUA_ERRFILE')
	static var ERRFILE:Int;

	/* key, in the registry, for table of loaded modules */
	@:native('::String(LUA_LOADED_TABLE)')
	static var LOADED_TABLE:String;

	/* key, in the registry, for table of preloaded modules */
	@:native('::String(LUA_PRELOAD_TABLE)')
	static var PRELOAD_TABLE:String;

	/* global table */
	@:native('LUAL_NUMSIZES')
	static var NUMSIZES:Int;

	@:native('luaL_checkversion')
	static function checkversion(L:cpp.RawPointer<Lua_State>):Void;

	@:native('luaL_getmetafield')
	static function getmetafield(L:cpp.RawPointer<Lua_State>, obj:Int, e:String):Int;

	@:native('luaL_callmeta')
	static function callmeta(L:cpp.RawPointer<Lua_State>, obj:Int, e:String):Int;

	@:functionCode("return ::String(luaL_tolstring(L, idx, len));")
	static inline function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Star<cpp.SizeT>):String;
		return null;

	@:native('luaL_argerror')
	static function argerror(L:cpp.RawPointer<Lua_State>, arg:Int, extramsg:String):Int;

	@:native('luaL_typeerror')
	static function typeerror(L:cpp.RawPointer<Lua_State>, arg:Int, tname:String):Int;

	@:functionCode("return ::String(luaL_checklstring(L, arg, l));")
	static inline function checklstring(L:cpp.RawPointer<Lua_State>, arg:Int, l:cpp.Star<cpp.SizeT>):String;
		return null;

	@:functionCode("return ::String(luaL_optlstring(L, arg, def, l));")
	static inline function optlstring(L:cpp.RawPointer<Lua_State>, arg:Int, def:String, l:cpp.Star<cpp.SizeT>):String;
		return null;

	@:native('luaL_checknumber')
	static function checknumber(L:cpp.RawPointer<Lua_State>, arg:Int):Float;

	@:native('luaL_optnumber')
	static function optnumber(L:cpp.RawPointer<Lua_State>, arg:Int, def:Float):Float;

	@:native('luaL_checkinteger')
	static function checkinteger(L:cpp.RawPointer<Lua_State>, arg:Int):Int;

	@:native('luaL_optinteger')
	static function optinteger(L:cpp.RawPointer<Lua_State>, arg:Int, def:Int):Int;

	/* open all previous libraries */
	@:native('luaL_openlibs')
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
