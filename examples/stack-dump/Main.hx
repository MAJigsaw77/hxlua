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

		/* pushing stuff to the stack */

		final mix:Array<Dynamic> = [true, 100, 10.011, 'hi', null];

		for (i in mix)
			pushToLua(vm, i);

		stackDump(vm);

		/* doing some operations */
		for (i in 0...5)
		{
			switch (i)
			{
				case 0:
					Lua.pushvalue(vm, 1); // Push the element with index 1 to the top of the stack.
				case 1:
					Lua.settop(vm, 4); // Set the top of the stack to 4.
				case 2:
					Lua.insert(vm, 3); // Move the top element of the stack to 3.
				case 3:
					Lua.replace(vm, 3); // Move the top element of the stack to position 3 and pop the top element of the stack.
				case 4:
					Lua.copy(vm, 2, 3); // Copy element with index 2 to position 3.
				case 5:
					Lua.pop(vm, 3); // The remaining 3 elements are popped off the stack.
			}

			stackDump(vm);
		}

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}

	private static function pushToLua(l:cpp.RawPointer<Lua_State>, val:Dynamic):Void
	{
		switch (Type.typeof(val))
		{
			case TNull:
				Lua.pushnil(l);
			case TInt:
				Lua.pushinteger(l, cast(val, Int));
			case TFloat:
				Lua.pushnumber(l, val);
			case TBool:
				Lua.pushboolean(l, val ? 1 : 0);
			case TClass(String):
				Lua.pushstring(l, cast(val, String));
			default:
				Sys.println('Couldn\'t convert "${Type.typeof(val)}" to Lua.');
		}
	}

	private static function stackDump(l:cpp.RawPointer<Lua_State>):Void
	{
		Sys.println('');

		for (i in 0...Lua.gettop(l))
		{
			final idx:Int = i + 1;

			switch (Lua.type(l, i + 1))
			{
				case type if (type == Lua.TNIL):
					Sys.println('null');
				case type if (type == Lua.TBOOLEAN):
					Sys.println(Lua.toboolean(l, idx) == 1);
				case type if (type == Lua.TNUMBER):
					Sys.println(Lua.tonumber(l, idx));
				case type if (type == Lua.TSTRING):
					Sys.println(cast(Lua.tostring(l, idx), String));
				default:
					Sys.println(cast(Lua.typename(l, idx), String));
			}
		}
	}
}
