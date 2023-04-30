package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	private static function kshit(L:cpp.RawPointer<Lua_State>, status:Int, ctx:Lua_KContext):Int
	{
		return 0;
	}

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

		Lua.yieldk(vm, 0, untyped __cpp__('0'), cpp.Function.fromStaticFunction(kshit));

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
