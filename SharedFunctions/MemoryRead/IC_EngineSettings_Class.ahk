; EngineSettings class contains IC's EngineSettings class structure. Useful for finding webroot for doing server calls.
#include %A_LineFile%\..\IC_GameObjectStructure_Class.ahk
class IC_EngineSettings32_Class
{
    StaticOffset := 0xFC0
    __new()
    {
        this.Refresh()
    }
 
    GetVersion()
    {
        return "v1.0.0, 12/03/21, IC v0.414+, 32-bit"  
    }

    Refresh()
    {
        this.Main := new _ClassMemory("ahk_exe IdleDragons.exe", "", hProcessCopy)
        this.BaseAddress := this.Main.getModuleBaseAddress("mono-2.0-bdwgc.dll")+0x003A1C54
        this.UnityGameEngine := {}
        this.UnityGameEngine.Core := {}
        this.UnityGameEngine.Core.EngineSettings := new GameObjectStructure([0x20])
        this.UnityGameEngine.Core.EngineSettings.BaseAddress := this.BaseAddress
        #include %A_LineFile%\..\Imports\IC_EngineSettings32_Import.ahk
    }
}

class IC_EngineSettings64_Class
{
    StaticOffset := 0xF60
    __new()
    {
        this.Refresh()
    }
 
    GetVersion()
    {
        return "v1.1.0, 2022-08-16, IC v0.463+, 64-bit"  
    }

    Refresh()
    {
        this.Main := new _ClassMemory("ahk_exe IdleDragons.exe", "", hProcessCopy)
        this.BaseAddress := this.Main.getModuleBaseAddress("mono-2.0-bdwgc.dll")+0x004A7678 ; v463+
        this.UnityGameEngine := {}
        this.UnityGameEngine.Core := {}
        this.UnityGameEngine.Core.EngineSettings := new GameObjectStructure([0x2A0]) ; v452
        this.UnityGameEngine.Core.EngineSettings.Is64Bit := true
        this.UnityGameEngine.Core.EngineSettings.BaseAddress := this.BaseAddress
        #include %A_LineFile%\..\Imports\IC_EngineSettings64_Import.ahk       
    }
}