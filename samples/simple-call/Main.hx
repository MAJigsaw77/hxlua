package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		/* version info */
		trace(Lua.VERSION);

		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
