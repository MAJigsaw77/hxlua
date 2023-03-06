# hxlua

![](https://img.shields.io/github/repo-size/MAJigsaw77/hxlua) ![](https://badgen.net/github/open-issues/MAJigsaw77/hxlua) ![](https://badgen.net/badge/license/MIT/green)

Haxe/hxcpp @:native bindings for Lua

### Installation

For now `hxlua` is available only on GitHub, so you have to simply type

```bash
haxelib git hxlua https://github.com/MAJigsaw77/hxlua.git
```

### Basic Usage Example

```hx
package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		// some informations

		trace(Lua.RELEASE);
		trace(Lua.COPYRIGHT);
		trace(Lua.AUTHORS);

		// create the new state
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		// open the libs
		LuaL.openlibs(vm);

		// do the file
		var ret:Int = LuaL.dofile(vm, "script.lua");

		// check if isn't ok
		if (ret != Lua.OK)
		{
			trace("Lua Error: " + Lua.tostring(vm, ret));
			Lua.pop(vm, 1);
		}

		// call 'foo' function
		Lua.getglobal(vm, "foo");
		Lua.pushinteger(vm, 1);
		Lua.pushnumber(vm, 2.0);
		Lua.pushstring(vm, "three");
		Lua.pcall(vm, 3, 0, 1);

		// close the state after pcall
		Lua.close(vm);
		vm = null;
	}
}
```

### Licensing

hxlua is made available under the MIT License. Check [LICENSE](./LICENSE) for more information.

Lua is made available under the MIT License. Check [Lua.org](https://www.lua.org/license.html) for more information.
