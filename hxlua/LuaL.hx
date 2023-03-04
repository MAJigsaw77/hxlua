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
	static inline function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Star<cpp.SizeT>):String
		return '';

	@:native('luaL_argerror')
	static function argerror(L:cpp.RawPointer<Lua_State>, arg:Int, extramsg:String):Int;

	@:native('luaL_typeerror')
	static function typeerror(L:cpp.RawPointer<Lua_State>, arg:Int, tname:String):Int;

	@:functionCode("return ::String(luaL_checklstring(L, arg, l));")
	static inline function checklstring(L:cpp.RawPointer<Lua_State>, arg:Int, l:cpp.Star<cpp.SizeT>):String
		return '';

	@:functionCode("return ::String(luaL_optlstring(L, arg, def, l));")
	static inline function optlstring(L:cpp.RawPointer<Lua_State>, arg:Int, def:String, l:cpp.Star<cpp.SizeT>):String
		return '';

	@:native('luaL_checknumber')
	static function checknumber(L:cpp.RawPointer<Lua_State>, arg:Int):Float;

	@:native('luaL_optnumber')
	static function optnumber(L:cpp.RawPointer<Lua_State>, arg:Int, def:Float):Float;

	@:native('luaL_checkinteger')
	static function checkinteger(L:cpp.RawPointer<Lua_State>, arg:Int):Int;

	@:native('luaL_optinteger')
	static function optinteger(L:cpp.RawPointer<Lua_State>, arg:Int, def:Int):Int;

	@:native('luaL_checkstack')
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int, msg:String):Void;

	@:native('luaL_checktype')
	static function checktype(L:cpp.RawPointer<Lua_State>, arg:Int, t:Int):Void;

	@:native('luaL_checkany')
	static function checkany(L:cpp.RawPointer<Lua_State>, arg:Int):Void;

	@:native('luaL_newmetatable')
	static function newmetatable(L:cpp.RawPointer<Lua_State>, tname:String):Int;

	@:native('luaL_setmetatable')
	static function setmetatable(L:cpp.RawPointer<Lua_State>, tname:String):Void;

	@:native('luaL_testudata')
	static function testudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:String):cpp.Star<cpp.Void>;

	@:native('luaL_checkudata')
	static function checkudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:String):cpp.Star<cpp.Void>;

	@:native('luaL_where')
	static function where(L:cpp.RawPointer<Lua_State>, lvl:Int):Void;

	@:native('luaL_error')
	static function error(L:cpp.RawPointer<Lua_State>, fmt:String, ...args:Dynamic):Int;

	@:native('luaL_checkoption')
	static function checkoption(L:cpp.RawPointer<Lua_State>, arg:Int, def:String, last:Array<String>):Int;

	@:native('luaL_fileresult')
	static function fileresult(L:cpp.RawPointer<Lua_State>, stat:Int, fname:String):Int;

	@:native('luaL_execresult')
	static function execresult(L:cpp.RawPointer<Lua_State>, stat:Int):Int;

	/* predefined references */
	@:native('LUA_NOREF')
	static var NOREF:Int;

	@:native('LUA_REFNIL')
	static var LUA_REFNIL:Int;

	@:native('luaL_ref')
	static function ref(L:cpp.RawPointer<Lua_State>, t:Int):Int;

	@:native('luaL_unref')
	static function unref(L:cpp.RawPointer<Lua_State>, t:Int, ref:Int):Void;

	@:native('luaL_loadfilex')
	static function loadfilex(L:cpp.RawPointer<Lua_State>, filename:String, mode:String):Int;

	@:native('luaL_loadfile')
	static function loadfile(L:cpp.RawPointer<Lua_State>, filename:String):Int;

	@:native('luaL_loadbufferx')
	static function loadbufferx(L:cpp.RawPointer<Lua_State>, buff:String, sz:cpp.SizeT, name:String, mode:String):Int;

	@:native('luaL_loadstring')
	static function loadstring(L:cpp.RawPointer<Lua_State>, s:String):Int;

	@:native('luaL_newstate')
	static function newstate():cpp.RawPointer<Lua_State>;

	@:native('luaL_len')
	static function len(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('luaL_addgsub')
	static function addgsub(b:cpp.RawPointer<LuaL_Buffer>, s:String, p:String, r:String):Void;

	@:functionCode("return ::String(luaL_gsub(L, s, p, r));")
	static inline function gsub(L:cpp.RawPointer<Lua_State>, s:String, p:String, r:String):String
		return '';

	@:native('luaL_setfuncs')
	static function setfuncs(L:cpp.RawPointer<Lua_State>, l:cpp.RawConstPointer<LuaL_Reg>, nup:Int):Void;

	@:native('luaL_getsubtable')
	static function getsubtable(L:cpp.RawPointer<Lua_State>, idx:Int, fname:String):Int;

	@:native('luaL_traceback')
	static function traceback(L:cpp.RawPointer<Lua_State>, L1:cpp.RawPointer<Lua_State>, msg:String, level:Int):Void;

	@:native('luaL_requiref')
	static function requiref(L:cpp.RawPointer<Lua_State>, modname:String, openf:Lua_CFunction, glb:Int):Void;

	/* open all previous libraries */
	@:native('luaL_openlibs')
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
