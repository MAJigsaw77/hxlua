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
    Lua.register(vm, "print", cpp.Function.fromStaticFunction(hx_print));

    /* run the script */
    LuaL.dofile(vm, "script.lua");

    /* cleanup Lua */
    Lua.close(vm);
    vm = null;
  }

  private static function hx_print(l:cpp.RawPointer<Lua_State>):Int
  {
    var n:Int = Lua.gettop(l);

    /* loop through each argument */
    for (i in 1...n + 1)
      Sys.println(Lua.tolstring(l, i, null));

    /* clear the stack */
    Lua.pop(l, n);
    return 0;
  }
}
