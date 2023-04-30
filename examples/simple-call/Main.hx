package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	private static function warnf(ud:cpp.Pointer<cpp.Void>, msg:cpp.ConstCharStar, tocont:Int):Void
	{
		Sys.println(cast(msg, String));
	}

	public static function main():Void
	{
		/* version info */
		Sys.println(Lua.VERSION);

		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		Lua.setwarnf(vm, cpp.Function.fromStaticFunction(warnf), untyped __cpp__('0'));

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
