package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.LuaOpen;

class Main
{
	public static function main():Void
	{
		trace(Lua.VERSION);
		trace(Lua.AUTHORS);
		trace(Lua.COPYRIGHT);
	}
}
