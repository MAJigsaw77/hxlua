package hxlua;

import hxlua.Types;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
@:unreflective
extern class LuaL
{
	/* open all previous libraries */
	@:native('luaL_openlibs')
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
