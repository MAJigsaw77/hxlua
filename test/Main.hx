package;

import hxlua.Lua;
import hxlua.LuaL;
inport hxlua.Types;

class Main
{
	public static function main():Void
	{
		var lua:cpp.RawPointer<Lua_State> = LuaL.newstate();
		LuaL.openlibs(lua);
		trace("Lua Version: " + Lua.version(lua));
	}
}
