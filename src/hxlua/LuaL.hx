package hxlua;

#if (!cpp && macro)
#error "Lua supports only C++ target platforms."
#end
import hxlua.Types;

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:unreflective
extern class LuaL
{
	@:native("LUAL_NUMSIZES")
	static var NUMSIZES:Int;

	@:native("luaL_checkversion")
	static function checkversion(L:cpp.RawPointer<Lua_State>):Void;

	@:native("luaL_getmetafield")
	static function getmetafield(L:cpp.RawPointer<Lua_State>, obj:Int, e:cpp.ConstCharStar):Int;

	@:native("luaL_callmeta")
	static function callmeta(L:cpp.RawPointer<Lua_State>, obj:Int, e:cpp.ConstCharStar):Int;

	@:native("luaL_tolstring")
	static function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Pointer<cpp.SizeT>):cpp.ConstCharStar;

	@:native("luaL_argerror")
	static function argerror(L:cpp.RawPointer<Lua_State>, arg:Int, extramsg:cpp.ConstCharStar):Int;

	@:native("luaL_typeerror")
	static function typeerror(L:cpp.RawPointer<Lua_State>, arg:Int, tname:cpp.ConstCharStar):Int;

	@:native("luaL_checklstring")
	static function checklstring(L:cpp.RawPointer<Lua_State>, arg:Int, l:cpp.Pointer<cpp.SizeT>):cpp.ConstCharStar;

	@:native("luaL_optlstring")
	static function optlstring(L:cpp.RawPointer<Lua_State>, arg:Int, def:cpp.ConstCharStar, l:cpp.Pointer<cpp.SizeT>):cpp.ConstCharStar;

	@:native("luaL_checknumber")
	static function checknumber(L:cpp.RawPointer<Lua_State>, arg:Int):Lua_Number;

	@:native("luaL_optnumber")
	static function optnumber(L:cpp.RawPointer<Lua_State>, arg:Int, def:Lua_Number):Lua_Number;

	@:native("luaL_checkinteger")
	static function checkinteger(L:cpp.RawPointer<Lua_State>, arg:Int):Lua_Integer;

	@:native("luaL_optinteger")
	static function optinteger(L:cpp.RawPointer<Lua_State>, arg:Int, def:Lua_Integer):Lua_Integer;

	@:native("luaL_checkstack")
	static function checkstack(L:cpp.RawPointer<Lua_State>, sz:Int, msg:cpp.ConstCharStar):Void;

	@:native("luaL_checktype")
	static function checktype(L:cpp.RawPointer<Lua_State>, arg:Int, t:Int):Void;

	@:native("luaL_checkany")
	static function checkany(L:cpp.RawPointer<Lua_State>, arg:Int):Void;

	@:native("luaL_newmetatable")
	static function newmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Int;

	@:native("luaL_setmetatable")
	static function setmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Void;

	@:native("luaL_testudata")
	static function testudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:cpp.ConstCharStar):cpp.Pointer<cpp.Void>;

	@:native("luaL_checkudata")
	static function checkudata(L:cpp.RawPointer<Lua_State>, ud:Int, tname:cpp.ConstCharStar):cpp.Pointer<cpp.Void>;

	@:native("luaL_where")
	static function where(L:cpp.RawPointer<Lua_State>, lvl:Int):Void;

	@:native("luaL_error")
	static function error(L:cpp.RawPointer<Lua_State>, fmt:cpp.ConstCharStar, args:cpp.Rest<cpp.VarArg>):Int;

	@:native("luaL_checkoption")
	static function checkoption(L:cpp.RawPointer<Lua_State>, arg:Int, def:cpp.ConstCharStar, last:Array<String>):Int;

	@:native("luaL_fileresult")
	static function fileresult(L:cpp.RawPointer<Lua_State>, stat:Int, fname:cpp.ConstCharStar):Int;

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
	static function loadfilex(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar, mode:cpp.ConstCharStar):Int;

	@:native("luaL_loadfile")
	static function loadfile(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar):Int;

	@:native("luaL_loadbufferx")
	static function loadbufferx(L:cpp.RawPointer<Lua_State>, buff:cpp.ConstCharStar, sz:cpp.SizeT, name:cpp.ConstCharStar, mode:cpp.ConstCharStar):Int;

	@:native("luaL_loadstring")
	static function loadstring(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar):Int;

	@:native("luaL_newstate")
	static function newstate():cpp.RawPointer<Lua_State>;

	@:native("luaL_len")
	static function len(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native("luaL_addgsub")
	static function addgsub(b:cpp.RawPointer<LuaL_Buffer>, s:cpp.ConstCharStar, p:cpp.ConstCharStar, r:cpp.ConstCharStar):Void;

	@:native("luaL_gsub")
	static function gsub(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, p:cpp.ConstCharStar, r:cpp.ConstCharStar):cpp.ConstCharStar;

	@:native("luaL_setfuncs")
	static function setfuncs(L:cpp.RawPointer<Lua_State>, l:cpp.RawConstPointer<LuaL_Reg>, nup:Int):Void;

	@:native("luaL_getsubtable")
	static function getsubtable(L:cpp.RawPointer<Lua_State>, idx:Int, fname:cpp.ConstCharStar):Int;

	@:native("luaL_traceback")
	static function traceback(L:cpp.RawPointer<Lua_State>, L1:cpp.RawPointer<Lua_State>, msg:cpp.ConstCharStar, level:Int):Void;

	@:native("luaL_requiref")
	static function requiref(L:cpp.RawPointer<Lua_State>, modname:cpp.ConstCharStar, openf:Lua_CFunction, glb:Int):Void;

	/*
	 * some useful macros
	 */
	@:native("luaL_newlibtable")
	static function newlibtable(L:cpp.RawPointer<Lua_State>, l:Array<LuaL_Reg>):Void;

	@:native("luaL_newlib")
	static function newlib(L:cpp.RawPointer<Lua_State>, l:Array<LuaL_Reg>):Void;

	@:native("luaL_argcheck")
	static function argcheck(L:cpp.RawPointer<Lua_State>, cond:Int, arg:Int, extramsg:cpp.ConstCharStar):Void;

	@:native("luaL_argexpected")
	static function argexpected(L:cpp.RawPointer<Lua_State>, cond:Int, arg:Int, tname:cpp.ConstCharStar):Void;

	@:native("luaL_checkstring")
	static function checkstring(L:cpp.RawPointer<Lua_State>, n:Int):cpp.ConstCharStar;

	@:native("luaL_optstring")
	static function optstring(L:cpp.RawPointer<Lua_State>, n:Int, d:cpp.ConstCharStar):cpp.ConstCharStar;

	@:native("luaL_typename")
	static function typename(L:cpp.RawPointer<Lua_State>, index:Int):cpp.ConstCharStar;

	@:native("luaL_dofile")
	static function dofile(L:cpp.RawPointer<Lua_State>, filename:cpp.ConstCharStar):Int;

	@:native("luaL_dostring")
	static function dostring(L:cpp.RawPointer<Lua_State>, str:cpp.ConstCharStar):Int;

	@:native("luaL_getmetatable")
	static function getmetatable(L:cpp.RawPointer<Lua_State>, tname:cpp.ConstCharStar):Int;

	@:native("luaL_loadbuffer")
	static function loadbuffer(L:cpp.RawPointer<Lua_State>, s:cpp.ConstCharStar, sz:cpp.SizeT, n:cpp.ConstCharStar):Int;

	/*
	 * Perform arithmetic operations on lua_Integer values with wrap-around
	 * semantics, as the Lua core does.
	 */
	@:native("luaL_intop")
	static function intop(op:Int, v1:Lua_Integer, v2:Lua_Integer):Lua_Integer;

	/* push the value used to represent failure/error */
	@:native("luaL_pushfail")
	static function pushfail(L:cpp.RawPointer<Lua_State>):Void;

	/*
	 * Generic Buffer manipulation
	 */
	@:native("luaL_bufflen")
	static function bufflen(B:cpp.RawPointer<LuaL_Buffer>):cpp.SizeT;

	@:native("luaL_buffaddr")
	static function buffaddr(B:cpp.RawPointer<LuaL_Buffer>):cpp.CharStar;

	@:native("luaL_addchar")
	static function addchar(B:cpp.RawPointer<LuaL_Buffer>, c:cpp.Char):Void;

	@:native("luaL_addsize")
	static function addsize(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.SizeT):Void;

	@:native("luaL_buffsub")
	static function buffsub(B:cpp.RawPointer<LuaL_Buffer>, n:Int):Void;

	@:native("luaL_buffinit")
	static function buffinit(L:cpp.RawPointer<Lua_State>, B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_prepbuffsize")
	static function prepbuffsize(B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):cpp.CharStar;

	@:native("luaL_addlstring")
	static function addlstring(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.ConstCharStar, l:cpp.SizeT):Void;

	@:native("luaL_addstring")
	static function addstring(B:cpp.RawPointer<LuaL_Buffer>, s:cpp.ConstCharStar):Void;

	@:native("luaL_addvalue")
	static function addvalue(B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_pushresult")
	static function pushresult(B:cpp.RawPointer<LuaL_Buffer>):Void;

	@:native("luaL_pushresultsize")
	static function pushresultsize(B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):Void;

	@:native("luaL_buffinitsize")
	static function buffinitsize(L:cpp.RawPointer<Lua_State>, B:cpp.RawPointer<LuaL_Buffer>, sz:cpp.SizeT):cpp.CharStar;

	@:native("luaL_prepbuff")
	static function prepbuff(B:cpp.RawPointer<LuaL_Buffer>):cpp.CharStar;

	/*
	 * Compatibility with deprecated conversions
	 */
	#if LUA_COMPAT_APIINTCASTS
	@:native("luaL_checkunsigned")
	static function checkunsigned(L:cpp.RawPointer<Lua_State>, a:Int):Lua_Unsigned;

	@:native("luaL_optunsigned")
	static function optunsigned(L:cpp.RawPointer<Lua_State>, a:Int, d:Lua_Unsigned):Lua_Unsigned;
	#end

	/* open all previous libraries */
	@:native("luaL_openlibs")
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
