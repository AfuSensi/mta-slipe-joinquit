-- Generated by CSharp.lua Compiler
local System = System
local SlipeSharedIO
System.import(function (out)
  SlipeSharedIO = Slipe.Shared.IO
end)
System.namespace("Slipe.Server.IO", function (namespace)
  namespace.class("MtaDebug", function (namespace)
    local __ctor__
    __ctor__ = function (this)
      SlipeSharedIO.SharedMtaDebug.__ctor__(this)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.IO.SharedMtaDebug
        }
      end,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x4, nil }
          },
          events = {
            { "OnMessage", 0xE, System.Delegate(out.Slipe.Shared.Elements.Element, out.Slipe.Server.IO.Events.OnDebugMessageEventArgs, System.Void) }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
