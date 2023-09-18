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
		
		var id:Map<String, String> = [
			'name' => 'Richard',
			'date' => '2016-08-15',
			'ip' => '10.0.0.1',
			'custom' => 'wibble'
		];

		Lua.createtable(vm, 0, Lambda.count(id));

		for (key => value in id)
		{
			Lua.pushstring(vm, key);
			Lua.pushstring(vm, value);
			Lua.settable(vm, -3); /* 3rd element from the stack top */
		}

		Lua.setglobal(vm, "mytable");

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
