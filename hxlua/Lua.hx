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
}
