package hxlua;

#if (!cpp && macro)
#error 'Lua supports only C++ target platforms.'
#end

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
	@:native('Lua_Debug')
	static function create():Lua_Debug;

	var event:Int;
	var name:String; /* (n) */
	var namewhat:String; /* (n) 'global', 'local', 'field', 'method' */
	var what:String; /* (S) 'Lua', 'C', 'main', 'tail' */
	var source:String; /* (S) */
	var srclen:cpp.SizeT; /* (S) */
	var currentline:Int; /* (l) */
	var linedefined:Int; /* (S) */
	var nups:cpp.UInt8; /* (u) number of upvalues */
	var nparams:cpp.UInt8; /* (u) number of parameters */
	var isvararg:cpp.Char; /* (u) */
	var istailcall:cpp.Char; /* (t) */
	var ftransfer:cpp.UInt16; /* (r) index of first value transferred */
	var ntransfer:cpp.UInt16; /* (r) number of transferred values */
	var short_src:Array<cpp.Char>; /* (S) max size is LUA_IDSIZE */
}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Buffer")
extern class LuaL_Buffer
{
	@:native('LuaL_Buffer')
	static function create():LuaL_Buffer;

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
	@:native('LuaL_Reg')
	static function create():LuaL_Reg;

	var name:String;
	var func:Lua_CFunction;
}

@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Stream")
extern class LuaL_Stream
{
	@:native('LuaL_Stream')
	static function create():LuaL_Stream;

	var f:cpp.Pointer<cpp.FILE>; /* stream (NULL for incompletely created streams) */
	var closef:Lua_CFunction; /* to close stream (NULL for closed streams) */
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
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.Pointer<cpp.Void>, sz:cpp.Pointer<cpp.SizeT>) -> String>;
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.ConstPointer<cpp.Void>, sz:cpp.SizeT, ud:cpp.Pointer<cpp.Void>) -> Int>;

/*
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.Pointer<cpp.Void>, ptr:cpp.Pointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.Pointer<cpp.Void>>;

/*
 * Type for warning functions.
 */
typedef Lua_WarnFunction = cpp.Callable<(ud:cpp.Pointer<cpp.Void>, msg:String, tocont:Int) -> Void>;
