package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		/* version info */
		Sys.println(Lua.VERSION);

		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		final prices:Map<Int, String> = [
			10 => 'apple',
			20 => 'banana',
			30 => 'cherry'
		];

		/* set some default values */
		for (key => value in prices)
		{
			Lua.pushinteger(vm, key);
			Lua.setglobal(vm, value);
		}

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
