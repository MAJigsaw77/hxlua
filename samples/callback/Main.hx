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

    /* register our function */
    Lua.register(vm, "average", cpp.Function.fromStaticFunction(average));

    /* run the script */
    LuaL.dofile(vm, "script.lua");

    /* cleanup Lua */
    Lua.close(vm);
    vm = null;
  }

  private static function average(l:cpp.RawPointer<Lua_State>):Int
  {
    var n:Int = Lua.gettop(l);
    var sum:Float = 0;

    /* loop through each argument */
    for (i in 1...n + 1)
    {
      if (Lua.isnumber(l, i) != 1)
      {
            Lua.pushstring(l, "Incorrect argument to 'average'");
            Lua.error(l);
      }

      /* total the arguments */
      sum += Lua.tonumber(l, i);
    }

    /* clear the stack */
    Lua.pop(l, n);

    /* push the average */
    Lua.pushnumber(l, sum / n);

    /* push the sum */
    Lua.pushnumber(l, sum);

    /* return the number of results */
    return 2;
  }
}
