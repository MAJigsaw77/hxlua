package hxlua;

import hxlua.Types;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
@:unreflective
extern class Lua
{
	@:native('LUA_VERSION_MAJOR')
	static var VERSION_MAJOR:String;

	@:native('LUA_VERSION_MINOR')
	static var VERSION_MINOR:String;

	@:native('LUA_VERSION_RELEASE')
	static var VERSION_RELEASE:String;

	@:native('LUA_VERSION_NUM')
	static var VERSION_NUM:Int;

	@:native('LUA_VERSION_RELEASE_NUM')
	static var VERSION_RELEASE_NUM:Int;

	@:native('LUA_VERSION')
	static var VERSION:String;

	@:native('LUA_RELEASE')
	static var RELEASE:String;

	@:native('LUA_COPYRIGHT')
	static var COPYRIGHT:String;

	@:native('LUA_AUTHORS')
	static var AUTHORS:String;

	@:native('LUA_VERSION_RELEASE')
	static var VERSION_RELEASE:String;

	@:native('LUA_MULTRET')
	static var MULTRET:Int;

	@:native('LUA_REGISTRYINDEX')
	static var REGISTRYINDEX:Int;

	@:native('lua_upvalueindex')
	static function upvalueindex(i:Int):Int;

	@:native('LUA_OK')
	static var OK:Int;

	@:native('LUA_YIELD')
	static var YIELD:Int;

	@:native('LUA_ERRRUN')
	static var ERRRUN:Int;

	@:native('LUA_ERRSYNTAX')
	static var ERRSYNTAX:Int;

	@:native('LUA_ERRMEM')
	static var ERRMEM:Int;

	@:native('LUA_ERRERR')
	static var ERRERR:Int;

	@:native('LUA_TNONE')
	static var TNONE:Int;

	@:native('LUA_TNIL')
	static var TNIL:Int;

	@:native('LUA_TBOOLEAN')
	static var TBOOLEAN:Int;

	@:native('LUA_TLIGHTUSERDATA')
	static var TLIGHTUSERDATA:Int;

	@:native('LUA_TNUMBER')
	static var TNUMBER:Int;

	@:native('LUA_TSTRING')
	static var TSTRING:Int;

	@:native('LUA_TTABLE')
	static var TTABLE:Int;

	@:native('LUA_TFUNCTION')
	static var TFUNCTION:Int;

	@:native('LUA_TUSERDATA')
	static var TUSERDATA:Int;

	@:native('LUA_TTHREAD')
	static var TTHREAD:Int;

	@:native('LUA_NUMTYPES')
	static var NUMTYPES:Int;

	@:native('LUA_MINSTACK')
	static var MINSTACK:Int;

	@:native('LUA_RIDX_MAINTHREAD')
	static var RIDX_MAINTHREAD:Int;

	@:native('LUA_RIDX_GLOBALS')
	static var RIDX_GLOBALS:Int;

	@:native('LUA_RIDX_LAST')
	static var RIDX_LAST:Int;

	/*
	 * state manipulation
	 */
	@:native('lua_newstate')
	static function newstate(f:Lua_Alloc, ud:cpp.Star<cpp.Void>):cpp.RawPointer<Lua_State>;

	@:native('lua_close')
	static function newstate(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_newthread')
	static function newthread(L:cpp.RawPointer<Lua_State>):cpp.RawPointer<Lua_State>;

	@:native('lua_resetthread')
	static function resetthread(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_atpanic')
	static function atpanic(L:cpp.RawPointer<Lua_State>, panicf:Lua_CFunction):Lua_CFunction;

	@:native('lua_version')
	static function version(L:cpp.RawPointer<Lua_State>):Float;

	/*
	 * basic stack manipulation
	 */
	@:native('lua_absindex')
	static function absindex(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_gettop')
	static function gettop(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_settop')
	static function settop(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_pushvalue')
	static function pushvalue(L:cpp.RawPointer<Lua_State>, idx:Int):Void;

	@:native('lua_rotate')
	static function rotate(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Void;

	@:native('lua_copy')
	static function copy(L:cpp.RawPointer<Lua_State>, fromidx:Int, toidx:Int):Void;

	@:native('lua_checkstack')
	static function checkstack(L:cpp.RawPointer<Lua_State>, n:Int):Int;

	@:native('lua_xmove')
	static function xmove(from:cpp.RawPointer<Lua_State>, to:cpp.RawPointer<Lua_State>, n:Int):Void;

	/*
	 * access functions (stack -> C)
	 */
	@:native('lua_isnumber')
	static function isnumber(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_isstring')
	static function isstring(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_iscfunction')
	static function iscfunction(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_isinteger')
	static function isinteger(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_isuserdata')
	static function isuserdata(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_type')
	static function type(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_typename')
	static function typename(L:cpp.RawPointer<Lua_State>, tp:Int):String;

	/*
	 * access functions (stack -> C)
	 */
	@:native('lua_tonumberx')
	static function tonumberx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Float;

	@:native('lua_tointegerx')
	static function tointegerx(L:cpp.RawPointer<Lua_State>, idx:Int, isnum:cpp.Star<Int>):Int;

	@:native('lua_toboolean')
	static function toboolean(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_tolstring')
	static function tolstring(L:cpp.RawPointer<Lua_State>, idx:Int, len:cpp.Star<cpp.SizeT>):String;

	@:native('lua_rawlen')
	static function rawlen(L:cpp.RawPointer<Lua_State>, idx:Int):UInt;

	@:native('lua_touserdata')
	static function touserdata(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.Star<cpp.Void>;

	@:native('lua_tothread')
	static function tothread(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.RawPointer<Lua_State>;

	@:native('lua_topointer')
	static function topointer(L:cpp.RawPointer<Lua_State>, idx:Int):cpp.ConstStar<cpp.Void>;

	/*
	 * Comparison and arithmetic functions
	 */
	@:native('LUA_OPADD')
	static var OPADD:Int; /* ORDER TM, ORDER OP */

	@:native('LUA_OPSUB')
	static var OPSUB:Int;

	@:native('LUA_OPMUL')
	static var OPMUL:Int;

	@:native('LUA_OPMOD')
	static var OPMOD:Int;

	@:native('LUA_OPPOW')
	static var OPPOW:Int;

	@:native('LUA_OPDIV')
	static var OPDIV:Int;

	@:native('LUA_OPIDIV')
	static var OPIDIV:Int;

	@:native('LUA_OPBAND')
	static var OPBAND:Int;

	@:native('LUA_OPBOR')
	static var OPBOR:Int;

	@:native('LUA_OPBXOR')
	static var OPBXOR:Int;

	@:native('LUA_OPSHL')
	static var OPSHL:Int;

	@:native('LUA_OPSHR')
	static var OPSHR:Int;

	@:native('LUA_OPUNM')
	static var OPUNM:Int;

	@:native('LUA_OPBNOT')
	static var OPBNOT:Int;

	@:native('lua_arith')
	static function arith(L:cpp.RawPointer<Lua_State>, op:Int):Void;

	@:native('LUA_OPEQ')
	static var OPEQ:Int;

	@:native('LUA_OPLT')
	static var OPLT:Int;

	@:native('LUA_OPLE')
	static var OPLE:Int;

	@:native('lua_rawequal')
	static function rawequal(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int):Int;

	@:native('lua_compare')
	static function compare(L:cpp.RawPointer<Lua_State>, idx1:Int, idx2:Int, op:Int):Int;

	/*
	 * push functions (C -> stack)
	 */
	@:native('lua_pushnil')
	static function pushnil(L:cpp.RawPointer<Lua_State>):Void;

	@:native('lua_pushnumber')
	static function pushnumber(L:cpp.RawPointer<Lua_State>, n:Float):Void;

	@:native('lua_pushinteger')
	static function pushinteger(L:cpp.RawPointer<Lua_State>, n:Int):Void;

	@:native('lua_pushlstring')
	static function pushlstring(L:cpp.RawPointer<Lua_State>, s:String, len:cpp.SizeT):Void;

	@:native('lua_pushstring')
	static function pushstring(L:cpp.RawPointer<Lua_State>, s:String):Void;

	// i have no idea how to interpret `VaList`
	// @:native('lua_pushvfstring')
	// static function pushvfstring(L:cpp.RawPointer<Lua_State>, s:String, argp:VaList):Void;

	@:native('lua_pushfstring')
	static function pushfstring(L:cpp.RawPointer<Lua_State>, fmt:String, ...args:Dynamic):String;

	@:native('lua_pushcclosure')
	static function pushcclosure(L:cpp.RawPointer<Lua_State>, fn:Lua_CFunction):Void;

	@:native('lua_pushboolean')
	static function pushboolean(L:cpp.RawPointer<Lua_State>, b:Int):Void;

	@:native('lua_pushlightuserdata')
	static function pushlightuserdata(L:cpp.RawPointer<Lua_State>, p:cpp.Star<cpp.Void>):Void;

	@:native('lua_pushthread')
	static function pushthread(L:cpp.RawPointer<Lua_State>):Int;

	/*
	 * get functions (Lua -> stack)
	 */
	@:native('lua_getglobal')
	static function getglobal(L:cpp.RawPointer<Lua_State>, name:String):Int;

	@:native('lua_gettable')
	static function gettable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_getfield')
	static function getfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:String):Int;

	@:native('lua_geti')
	static function geti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_rawget')
	static function rawget(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_rawgeti')
	static function rawgeti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_rawgetp')
	static function rawgetp(L:cpp.RawPointer<Lua_State>, idx:Int, p:cpp.ConstStar<cpp.Void>):Int;

	@:native('lua_createtable')
	static function createtable(L:cpp.RawPointer<Lua_State>, narr:Int, nrec:Int):Void;

	@:native('lua_newuserdatauv')
	static function newuserdatauv(L:cpp.RawPointer<Lua_State>, sz:cpp.SizeT, nuvalue:Int):cpp.Star<cpp.Void>;

	@:native('lua_getmetatable')
	static function getmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	@:native('lua_getiuservalue')
	static function getiuservalue(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	/*
	 * set functions (stack -> Lua)
	 */
	@:native('lua_setglobal')
	static function setglobal(L:cpp.RawPointer<Lua_State>, name:String):Int;

	@:native('lua_settable')
	static function settable(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_setfield')
	static function setfield(L:cpp.RawPointer<Lua_State>, idx:Int, k:String):Int;

	@:native('lua_seti')
	static function seti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_rawset')
	static function rawset(L:cpp.RawPointer<Lua_State>, idx:Int):Int;

	@:native('lua_rawseti')
	static function rawseti(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	@:native('lua_rawsetp')
	static function rawsetp(L:cpp.RawPointer<Lua_State>, idx:Int, p:cpp.ConstStar<cpp.Void>):Int;

	@:native('lua_setmetatable')
	static function setmetatable(L:cpp.RawPointer<Lua_State>, objindex:Int):Int;

	@:native('lua_setiuservalue')
	static function setiuservalue(L:cpp.RawPointer<Lua_State>, idx:Int, n:Int):Int;

	/*
	 * 'load' and 'call' functions (load and run Lua code)
	 */
	@:native('lua_callk')
	static function callk(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, ctx:Lua_KContext, k:Lua_KFunction):Int;

	@:native('lua_call')
	static function call(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int):Int;

	@:native('lua_pcallk')
	static function pcallk(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, errfunc:Int, ctx:Lua_KContext, k:Lua_KFunction):Int;

	@:native('lua_pcall')
	static function call(L:cpp.RawPointer<Lua_State>, nargs:Int, nresults:Int, errfunc:Int):Int;

	@:native('lua_load')
	static function load(L:cpp.RawPointer<Lua_State>, reader:Lua_Reader, dt:cpp.Star<cpp.Void>, chunkname:String, mode:String):Int;

	@:native('lua_dump')
	static function dump(L:cpp.RawPointer<Lua_State>, reader:Lua_Writer, data:cpp.Star<cpp.Void>, strip:Int):Int;

	/*
	 * coroutine functions
	 */
	@:native('lua_yieldk')
	static function yieldk(L:cpp.RawPointer<Lua_State>, nresults:Int, ctx:Lua_KContext, k:Lua_KFunction):Int;

	@:native('lua_resume')
	static function resume(L:cpp.RawPointer<Lua_State>, from:cpp.RawPointer<Lua_State>, nargs:Int, nres:Int):Int;

	@:native('lua_status')
	static function status(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_isyieldable')
	static function isyieldable(L:cpp.RawPointer<Lua_State>):Int;

	@:native('lua_yield')
	static function yield(L:cpp.RawPointer<Lua_State>, nresults:Int):Int;
}
