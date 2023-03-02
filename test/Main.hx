package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.LuaOpen;

class Main
{
	public static function main():Void
	{
		trace('hmm');
		trace(Lua.VERSION_NUM + Lua.VERSION_RELEASE_NUM);
	}
}
