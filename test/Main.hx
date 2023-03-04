package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();
		LuaL.openlibs(vm);
		trace("Lua Version: " + Lua.version(vm));

		var ret:Int = LuaL.dostring(vm, '
			function foo(i, f, s) 
			    print("Called foo(), i = "..i..", f = "..f..", s = '"..s.."'") 
			end
		');

		if (ret != Lua.OK)
		{
			Sys.printIn("Script Error: " + Lua.tostring(vm, ret));
			Lua.pop(vm, 1);
			Lua.close(vm);
			vm = null;
		}
		else
		{
			Lua.getglobal(vm, "foo");
			Lua.pushinteger(vm, 1);
			Lua.pushnumber(vm, 2.0);
			Lua.pushstring(vm, "three");
			Lua.pcall(vm, 3, 0, 1);
			Lua.close(vm);
			vm = null;
		}
	}
}
