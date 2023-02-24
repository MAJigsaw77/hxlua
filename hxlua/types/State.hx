package hxlua;

typedef State = cpp.RawPointer<LuaState>;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
@:native("luaState")
extern class LuaState {}
