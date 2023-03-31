package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		var stack:Int = Lua.gettop(vm);
		trace('stack: $stack');

		var num:Int = Lua.tointeger(vm, 1);
		trace('num: $num');

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
