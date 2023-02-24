package hxlua;

@:buildXml("<include name='${haxelib:hxlua}/project/Build.xml' />")
@:include("lua.hpp")
@:keep
extern class Lua
{
	static final LUA_VERSION_MAJOR:String = "5";
	static final LUA_VERSION_MINOR:String = "4";
	static final LUA_VERSION_RELEASE:String = "4";

	static final LUA_VERSION_NUM:Int = 504;
	static final LUA_VERSION_RELEASE_NUM:Int = (LUA_VERSION_NUM * 100 + 4);

	static final LUA_VERSION:String = "Lua " + LUA_VERSION_MAJOR + "." + LUA_VERSION_MINOR;
	static final LUA_RELEASE:String = LUA_VERSION + "." + LUA_VERSION_RELEASE;
	static final LUA_COPYRIGHT:String = LUA_RELEASE + "  Copyright (C) 1994-2022 Lua.org, PUC-Rio";
	static final LUA_AUTHORS:String = "R. Ierusalimschy, L. H. de Figueiredo, W. Celes";

	/* mark for precompiled code ('<esc>Lua') */
	static final LUA_VERSION_RELEASE:String = "\x1bLua";

	/* option for multiple returns in 'lua_pcall' and 'lua_call' */	
	static final LUA_MULTRET:Int = -1;
}
