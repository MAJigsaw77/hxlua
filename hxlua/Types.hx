package hxlua;

#if (!cpp && macro)
#error "Lua supports only C++ target platforms."
#end

class Types {} // blank

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:native("lua_State")
extern class Lua_State {}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:native("lua_KContext")
extern class Lua_KContext {}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:structAccess
@:native("lua_Debug")
extern class Lua_Debug
{
	@:native("lua_Debug")
	static function create():Lua_Debug;

	var event:Int;
	var name:cpp.ConstCharStar; /* (n) */
	var namewhat:cpp.ConstCharStar; /* (n) "global", "local", "field", "method" */
	var what:cpp.ConstCharStar; /* (S) "Lua", "C", "main", "tail" */
	var source:cpp.ConstCharStar; /* (S) */
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

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Buffer")
extern class LuaL_Buffer
{
	@:native("luaL_Buffer")
	static function create():LuaL_Buffer;

	var b:cpp.ConstCharStar;
	var size:cpp.SizeT;
	var n:cpp.SizeT;
	var L:cpp.RawPointer<Lua_State>;
}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Reg")
extern class LuaL_Reg
{
	@:native("luaL_Reg")
	static function create():LuaL_Reg;

	var name:cpp.ConstCharStar;
	var func:Lua_CFunction;
}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include("lua.hpp")
@:keep
@:structAccess
@:native("luaL_Stream")
extern class LuaL_Stream
{
	@:native("luaL_Stream")
	static function create():LuaL_Stream;

	var f:cpp.FILE; /* stream (NULL for incompletely created streams) */
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
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.Pointer<cpp.Void>, sz:cpp.Pointer<cpp.SizeT>) -> cpp.ConstCharStar>;
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.ConstPointer<cpp.Void>, sz:cpp.SizeT, ud:cpp.Pointer<cpp.Void>) -> Int>;

/*
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.Pointer<cpp.Void>, ptr:cpp.Pointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.Pointer<cpp.Void>>;

/*
 * Type for warning functions.
 */
typedef Lua_WarnFunction = cpp.Callable<(ud:cpp.Pointer<cpp.Void>, msg:cpp.ConstCharStar, tocont:Int) -> Void>;
