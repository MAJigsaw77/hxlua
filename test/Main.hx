package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		trace(Lua.RELEASE);
		trace(Lua.COPYRIGHT);
		trace(Lua.AUTHORS);

		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();
		LuaL.openlibs(vm);
		var ret:Int = LuaL.dofile(vm, "script.lua");

		if (ret != Lua.OK)
		{
			trace("Lua Error: " + Lua.tostring(vm, ret));
			Lua.pop(vm, 1);
		}

		Lua.getglobal(vm, "foo");
		Lua.pushinteger(vm, 1);
		Lua.pushnumber(vm, 2.0);
		Lua.pushstring(vm, "three");
		Lua.pcall(vm, 3, 0, 1);
		Lua.close(vm);
		vm = null;
	}
}
