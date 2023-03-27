package hxlua;

#if (!cpp && macro)
#error "Lua supports only C++ target platforms."
#end
import hxlua.Types;

@:include("lua.hpp")
@:keep
@:unreflective
extern class LuaL
{
	@:native("LUAL_NUMSIZES")
	static var NUMSIZES:Int;

	@:native("luaL_checkversion")
	static function checkversion(L:cpp.RawPointer<Lua_State>):Void;

	@:native("luaL_getmetafield")
	static function getmetafield(L:cpp.RawPointer<Lua_State>, obj:Int, e:String):Int;

	@:native("luaL_callmeta")
	static function callmeta(L:cpp.RawPointer<Lua_State>, obj:Int, e:String):Int;

	static inline function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Pointer<cpp.SizeT>):String
		return untyped __cpp__("::String(luaL_tolstring({0}, {1}, {2}))", L, idx, len);

	@:native("luaL_argerror")
	static function argerror(L:cpp.RawPointer<Lua_State>, arg:Int, extramsg:String):Int;

	@:native("luaL_typeerror")
	static function typeerror(L:cpp.RawPointer<Lua_State>, arg:Int, tname:String):Int;

	static inline function checklstring(L:cpp.RawPointer<Lua_State>, arg:Int, l:cpp.Pointer<cpp.SizeT>):String
		return untyped __cpp__("::String(luaL_checklstring({0}, {1}, {2}))", L, arg, l);

	static inline function optlstring(L:cpp.RawPointer<Lua_State>, arg:Int, def:String, l:cpp.Pointer<cpp.SizeT>):String
		return untyped __cpp__("::String(luaL_optlstring({0}, {1}, {2}, {3}))", L, arg, def, l);

	@:native("luaL_checknumber")
	static function checknumber(L:cpp.RawPointer<Lua_State>, arg:Int):Float;

	@:native("luaL_optnumber")
	static function optnumber(L:cpp.RawPointer<Lua_State>, arg:Int, def:Float):Float;

	@:native("luaL_checkinteger")
	static function checkinteger(L:cpp.RawPointer<Lua_State>, arg:Int):Int;

	@:native("luaL_optinteger")
	static function optinteger(L:cpp.RawPointer<Lua_State>, arg:Int, def:Int):Int;

	@:native("luaL_checkstack")
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int, msg:String):Void;

	@:native("luaL_checktype")
	static function checktype(L:cpp.RawPointer<Lua_State>, arg:Int, t:Int):Void;

	@:native("luaL_checkany")
	static function checkany(L:cpp.RawPointer<Lua_State>, arg:Int):Void;

	@:native("luaL_newmetatable")
	static function newmetatable(L:cpp.RawPointer<Lua_State>, tname:String):Int;

	@:native("luaL_setmetatable")
	static function setmetatable(L:cpp.RawPointer<Lua_State>, tname:String):Void;

	@:native("luaL_testudata")
	static function testudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:String):cpp.Pointer<cpp.Void>;

	@:native("luaL_checkudata")
	static function checkudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:String):cpp.Pointer<cpp.Void>;

	@:native("luaL_where")
	static function where(L:cpp.RawPointer<Lua_State>, lvl:Int):Void;

	@:native("luaL_error")
	static function error(L:cpp.RawPointer<Lua_State>, fmt:String, ...args:Dynamic):Int;

	@:native("luaL_checkoption")
	static function checkoption(L:cpp.RawPointer<Lua_State>, arg:Int, def:String, last:Array<String>):Int;

	@:native("luaL_fileresult")
	static function fileresult(L:cpp.RawPointer<Lua_State>, stat:Int, fname:String):Int;

	@:native("luaL_execresult")
	static function execresult(L:cpp.RawPointer<Lua_State>, stat:Int):Int;

	/* predefined references */
	@:native("LUA_NOREF")
	static var NOREF:Int;

	@:native("LUA_REFNIL")
	static var LUA_REFNIL:Int;

	@:native("luaL_ref")
	static function ref(L:cpp.RawPointer<Lua_State>, t:Int):Int;

	@:native("luaL_unref")
	static function unref(L:cpp.RawPointer<Lua_State>, t:Int, ref:Int):Void;

	@:native("luaL_loadfilex")
	static function loadfilex(L:cpp.RawPointer<Lua_State>, filename:String, mode:String):Int;

	@:native("luaL_loadfile")
	static function loadfile(L:cpp.RawPointer<Lua_State>, filename:String):Int;

	@:native("luaL_loadbufferx")
	static function loadbufferx(L:cpp.RawPointer<Lua_State>, buff:String, sz:cpp.SizeT, name:String, mode:String):Int;

	@:native("luaL_loadstring")
	static function loadstring(L:cpp.RawPointer<Lua_State>, s:String):Int;

	@:native("luaL_newstate")
	static function newstate():cpp.RawPointer<Lua_State>;

	@:native("luaL_len")
	static function len(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native("luaL_addgsub")
	static function addgsub(b:cpp.RawPointer<LuaL_Buffer>, s:String, p:String, r:String):Void;

	static inline function gsub(L:cpp.RawPointer<Lua_State>, s:String, p:String, r:String):String
		return untyped __cpp__("::String(luaL_gsub({0}, {1}, {2}, {3}))", L, s, p, r);

	@:native("luaL_setfuncs")
	static function setfuncs(L:cpp.RawPointer<Lua_State>, l:cpp.RawConstPointer<LuaL_Reg>, nup:Int):Void;

	@:native("luaL_getsubtable")
	static function getsubtable(L:cpp.RawPointer<Lua_State>, idx:Int, fname:String):Int;

	@:native("luaL_traceback")
	static function traceback(L:cpp.RawPointer<Lua_State>, L1:cpp.RawPointer<Lua_State>, msg:String, level:Int):Void;

	@:native("luaL_requiref")
	static function requiref(L:cpp.RawPointer<Lua_State>, modname:String, openf:Lua_CFunction, glb:Int):Void;

	/*
	 * some useful macros
	 */
	@:native("luaL_newlibtable")
	static function newlibtable(L:cpp.RawPointer<Lua_State>, l:Array<LuaL_Reg>):Void;

	@:native("luaL_newlib")
	static function newlib(L:cpp.RawPointer<Lua_State>, l:Array<LuaL_Reg>):Void;

	@:native("luaL_argcheck")
	static function argcheck(L:cpp.RawPointer<Lua_State>, cond:Int, arg:Int, extramsg:String):Void;

	@:native("luaL_argexpected")
	static function argexpected(L:cpp.RawPointer<Lua_State>, cond:Int, arg:Int, tname:String):Void;

	static inline function checkstring(L:cpp.RawPointer<Lua_State>, n:Int):String
		return untyped __cpp__("::String(luaL_checkstring({0}, {1}))", L, n);

	static inline function optstring(L:cpp.RawPointer<Lua_State>, n:Int, d:String):String
		return untyped __cpp__("::String(luaL_optstring({0}, {1}, {2}))", L, n, d);

	static inline function typename(L:cpp.RawPointer<Lua_State>, index:Int):String
		return untyped __cpp__("::String(luaL_typename({0}, {1}))", L, index);

	@:native("luaL_dofile")
	static function dofile(L:cpp.RawPointer<Lua_State>, filename:String):Int;

	@:native("luaL_dostring")
	static function dostring(L:cpp.RawPointer<Lua_State>, str:String):Int;

	@:native("luaL_getmetatable")
	static function getmetatable(L:cpp.RawPointer<Lua_State>, tname:String):Int;

	@:native("luaL_loadbuffer")
	static function loadbuffer(L:cpp.RawPointer<Lua_State>, s:String, sz:cpp.SizeT, n:String):Int;

	/*
	 * Perform arithmetic operations on lua_Integer values with wrap-around
	 * semantics, as the Lua core does.
	 */
	@:native("luaL_intop")
	static function intop(op:Int, v1:Int, v2:Int):Int;

	/* push the value used to represent failure/error */
	@:native("luaL_pushfail")
	static function pushfail(L:cpp.RawPointer<Lua_State>):Void;

	/*
	 * Generic Buffer manipulation
	 */
	@:native("luaL_bufflen")
	static function bufflen(B:cpp.RawPointer<LuaL_Buffer>):cpp.SizeT;

	@:native("luaL_buffaddr")
	static function buffaddr(B:cpp.RawPointer<LuaL_Buffer>):cpp.Pointer<cpp.Char>;

	@:native("luaL_addchar")
	static function addchar(B:cpp.RawPointer<LuaL_Buffer>, c:cpp.Char):Void;

	@:native("luaL_addsize")
	static function addsize(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.SizeT):Void;

	@:native("luaL_buffsub")
	static function buffsub(B:cpp.RawPointer<LuaL_Buffer>, n:Int):Void;

	@:native("luaL_buffinit")
	static function buffinit(L:cpp.RawPointer<Lua_State>, B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_prepbuffsize")
	static function prepbuffsize(B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):cpp.Pointer<cpp.Char>;

	@:native("luaL_addlstring")
	static function addlstring(B:cpp.RawPointer<LuaL_Buffer>, s:String, l:cpp.SizeT):Void;

	@:native("luaL_addstring")
	static function addstring(B:cpp.RawPointer<LuaL_Buffer>, s:String):Void;

	@:native("luaL_addvalue")
	static function addvalue(B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_pushresult")
	static function pushresult(B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_pushresultsize")
	static function pushresultsize(B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):Void;

	@:native("luaL_buffinitsize")
	static function buffinitsize(L:cpp.RawPointer<Lua_State>, B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):cpp.Pointer<cpp.Char>;

	@:native("luaL_prepbuff")
	static function prepbuff(B:cpp.RawPointer<LuaL_Buffer>):cpp.Pointer<cpp.Char>;

	/* open all previous libraries */
	@:native("luaL_openlibs")
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
