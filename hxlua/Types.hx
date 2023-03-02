package hxlua;

class Types {} // blank

@:include("lua.hpp")
@:keep
@:native("lua_State")
extern class Lua_State {}

@:include("lua.hpp")
@:keep
@:native("lua_KContext")
extern class Lua_KContext {}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("lua_Debug")
extern class Lua_Debug
{
	var event:Int;
	var name:String; /* (n) */
	var namewhat:String; /* (n) 'global', 'local', 'field', 'method' */
	var what:String; /* (S) 'Lua', 'C', 'main', 'tail' */
	var source:String; /* (S) */
	var srclen:cpp.SizeT; /* (S) */
	var currentline:Int; /* (l) */
	var linedefined:Int; /* (S) */
	var isvararg:cpp.Char; /* (S) */
	var istailcall:cpp.Char; /* (S) */
}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Buffer")
extern class LuaL_Buffer
{
	var b:String;
	var size:cpp.SizeT;
	var n:cpp.SizeT;
	var L:cpp.RawPointer<Lua_State>;
}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Reg")
extern class LuaL_Reg
{
	var name:String;
	var func:Lua_CFunction;
}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Stream")
extern class LuaL_Stream
{
	var f:cpp.Star<cpp.FILE>;
	var closef:Lua_CFunction;
}

/*
 * Type for debugging hook functions.
 */
typedef Lua_Hook = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ar:cpp.RawPointer<Lua_Debug>) -> Void>;

/*
 * Type for C functions registered with Lua.
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>) -> Int>;

/*
 * Type for continuation functions.
 */
typedef Lua_KFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>, status:Int, ctx:Lua_KContext) -> Int>;

/*
 * Type for functions that read/write blocks when loading/dumping Lua chunks.
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.Star<cpp.Void>, sz:cpp.Star<cpp.SizeT>) -> String>;
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.ConstStar<cpp.Void>, sz:cpp.SizeT, ud:cpp.Star<cpp.Void>) -> Int>;

/*
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.Star<cpp.Void>, ptr:cpp.Star<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.Star<cpp.Void>>;

/*
 * Type for warning functions.
 */
typedef Lua_WarnFunction = cpp.Callable<(ud:cpp.Star<cpp.Void>, msg:String, tocont:Int) -> Void>;
