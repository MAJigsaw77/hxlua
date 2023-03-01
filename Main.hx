package;

import hxlua.Lua;

class Main
{
	public static function main():Void
	{
		trace(Lua.VERSION);
		trace(Lua.AUTHORS);
		trace(Lua.COPYRIGHT);

		Sys.exit(0); // shutting this down
	}
}
