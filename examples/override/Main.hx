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

		/* register our function */
		Lua.register(vm, "print", cpp.Function.fromStaticFunction(print));

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = untyped __cpp__('NULL');
	}

	private static function print(l:cpp.RawPointer<Lua_State>):Int
	{
		var n:Int = Lua.gettop(l);

		/* loop through each argument */
		for (i in 0...n)
			Sys.println(cast(Lua.tostring(l, i + 1), String));

		/* clear the stack */
		Lua.pop(l, n);
		return 0;
	}
}
