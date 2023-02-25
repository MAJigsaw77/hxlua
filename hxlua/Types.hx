package hxlua;

class Types {}

@:include("lua.hpp")
@:keep
@:native("lua_State")
extern class Lua_State {}

/* type for continuation-function contexts */
@:include("lua.hpp")
@:keep
@:native("lua_KContext")
extern class Lua_KContext {}

/*
 * Type for C functions registered with Lua
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>) -> Int>;

/*
 * Type for continuation functions
 */
typedef Lua_KFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>, status:Int, ctx:Lua_KContext) -> Int>;

/*
 * Type for functions that read/write blocks when loading/dumping Lua chunks
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.Star<cpp.Void>, sz:cpp.Star<cpp.SizeT>) -> String>;
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:String, sz:cpp.SizeT, ud:cpp.Star<cpp.Void>) -> String>;

/*
 * Type for memory-allocation functions
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.Star<cpp.Void>, ptr:cpp.Star<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.Star<cpp.Void>>;

/*
 * Type for warning functions
 */
typedef Lua_WarnFunction = cpp.Callable<(L:ud:cpp.Star<cpp.Void>, msg:String, tocont:Int) -> Void>;
