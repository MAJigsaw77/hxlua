package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();
		LuaL.openlibs(vm);
		trace("Lua Version: " + Lua.version(vm));
	}
}
