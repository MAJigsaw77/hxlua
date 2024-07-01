package;

import haxe.Int64;
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

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		trace('stack: ${Lua.gettop(vm)}');
		trace('num: ${cast(Lua.tointeger(vm, 1), Int64)}');

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
