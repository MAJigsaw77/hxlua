package hxlua;

#if !cpp
#error 'Lua supports only C++ target platforms.'
#end
class Types {}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_State')
extern class Lua_State {}

/**
 * Type of numbers in Lua.
 */
@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Number')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Number from Float to Float {}

/**
 * Type for integer functions
 */
@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Integer')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Integer from cpp.Int64 to cpp.Int64 {}

/**
 * Type of unsigned integer.
 */
@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_Unsigned')
@:scalar
@:coreType
@:notNull
extern abstract Lua_Unsigned from cpp.UInt64 to cpp.UInt64 {}

/**
 * Type for continuation-function contexts.
 */
@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('lua_KContext')
@:scalar
@:coreType
@:notNull
extern abstract Lua_KContext from Int to Int {}

/**
 * Type for C functions registered with Lua.
 */
typedef Lua_CFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>) -> Int>;

/**
 * Type for continuation functions.
 */
typedef Lua_KFunction = cpp.Callable<(L:cpp.RawPointer<Lua_State>, status:Int, ctx:Lua_KContext) -> Int>;

/**
 * Type for functions that read blocks when loading/dumping Lua chunks.
 */
typedef Lua_Reader = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ud:cpp.RawPointer<cpp.Void>, sz:cpp.RawPointer<cpp.SizeT>) -> cpp.ConstCharStar>;

/**
 * Type for functions that write blocks when loading/dumping Lua chunks.
 */
typedef Lua_Writer = cpp.Callable<(L:cpp.RawPointer<Lua_State>, p:cpp.RawConstPointer<cpp.Void>, sz:cpp.SizeT, ud:cpp.RawPointer<cpp.Void>) -> Int>;

/**
 * Type for memory-allocation functions.
 */
typedef Lua_Alloc = cpp.Callable<(ud:cpp.RawPointer<cpp.Void>, ptr:cpp.RawPointer<cpp.Void>, osize:cpp.SizeT, nsize:cpp.SizeT) -> cpp.RawPointer<cpp.Void>>;

/**
 * Type for warning functions.
 */
typedef Lua_WarnFunction = cpp.Callable<(ud:cpp.RawPointer<cpp.Void>, msg:cpp.ConstCharStar, tocont:Int) -> Void>;

/**
 * Type for debugging hook functions.
 */
typedef Lua_Hook = cpp.Callable<(L:cpp.RawPointer<Lua_State>, ar:cpp.RawPointer<Lua_Debug>) -> Void>;

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('lua_Debug')
extern class Lua_Debug
{
	@:native('lua_Debug')
	static function alloc():Lua_Debug;

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
	var short_src:cpp.CastCharStar; /* (S) max size is LUA_IDSIZE */
}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Buffer')
extern class LuaL_Buffer
{
	@:native('luaL_Buffer')
	static function alloc():LuaL_Buffer;

	var b:cpp.ConstCharStar;
	var size:cpp.SizeT;
	var n:cpp.SizeT;
	var L:cpp.RawPointer<Lua_State>;
}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:unreflective
@:structAccess
@:native('luaL_Reg')
extern class LuaL_Reg
{
	@:native('luaL_Reg')
	static function alloc():LuaL_Reg;

	var name:cpp.ConstCharStar;
	var func:Lua_CFunction;
}
