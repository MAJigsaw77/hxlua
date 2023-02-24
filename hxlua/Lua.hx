package hxlua;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
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
}