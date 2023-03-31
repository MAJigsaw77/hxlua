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

		Lua.createtable(vm, 0, 4);

		Lua.pushstring(vm, "name");
		Lua.pushstring(vm, "Richard");
		Lua.settable(vm, -3); /* 3rd element from the stack top */

		Lua.pushstring(vm, "date");
		Lua.pushstring(vm, "2016-08-15");
		Lua.settable(vm, -3);

		Lua.pushstring(vm, "ip");
		Lua.pushstring(vm, "10.0.0.1");
		Lua.settable(vm, -3);

		Lua.pushstring(vm, "custom");
		Lua.pushstring(vm, "wibble");
		Lua.settable(vm, -3);

		Lua.setglobal(vm, "mytable");

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
