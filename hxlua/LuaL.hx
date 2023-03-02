package hxlua;

import hxlua.Types;

@:include("lua.hpp")
@:keep
@:unreflective
extern class LuaL
{
	/* open all previous libraries */
	@:native('luaL_openlibs')
	static function openlibs(L:cpp.RawPointer<Lua_State>):Int;
}
