-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerPeds
local SlipeSharedElements
local SlipeSharedIO
local DictDelegateDelegate
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerPeds = Slipe.Server.Peds
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedIO = Slipe.Shared.IO
  DictDelegateDelegate = System.Dictionary(System.Delegate, System.Delegate)
end)
System.namespace("Slipe.Server.IO", function (namespace)
  namespace.class("Input", function (namespace)
    local closures, BindKey, UnbindKey, BindKey1, UnbindKey1, static
    static = function (this)
      closures = DictDelegateDelegate()
    end
    -- <summary>
    -- Binds a key to a command
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="command"></param>
    -- <returns></returns>
    BindKey = function (player, key, state, command)
      return SlipeMtaDefinitions.MtaServer.BindKey(player:getMTAElement(), key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), command)
    end
    -- <summary>
    -- Unbinds a key from a command
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="command"></param>
    -- <returns></returns>
    UnbindKey = function (player, key, state, command)
      return SlipeMtaDefinitions.MtaServer.UnbindKey(player:getMTAElement(), key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), command)
    end
    -- <summary>
    -- Binds a key to a method
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="handler"></param>
    -- <returns></returns>
    BindKey1 = function (player, key, state, handler)
      local rawClosure = function (element, command, state)
        handler(System.cast(SlipeServerPeds.Player, SlipeSharedElements.ElementManager.getInstance():GetElement1(element)), command, System.Enum.Parse(state, System.Int32))
      end
      closures:set(handler, rawClosure)
      return SlipeMtaDefinitions.MtaServer.BindKey(player:getMTAElement(), key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), rawClosure)
    end
    -- <summary>
    -- Unbinds a key from a method
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="handler"></param>
    -- <returns></returns>
    UnbindKey1 = function (player, key, state, handler)
      if closures:ContainsKey(handler) then
        local result = SlipeMtaDefinitions.MtaServer.UnbindKey(player:getMTAElement(), key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), closures:get(handler))
        closures:RemoveKey(handler)
        return result
      end
      return false
    end
    return {
      BindKey = BindKey,
      UnbindKey = UnbindKey,
      BindKey1 = BindKey1,
      UnbindKey1 = UnbindKey1,
      static = static,
      __metadata__ = function (out)
        return {
          fields = {
            { "closures", 0x9, System.Dictionary(System.Delegate(out.Slipe.Server.Peds.Player, System.String, System.Int32, System.Void), System.Delegate(out.Slipe.MtaDefinitions.MtaElement, System.String, System.String, System.Void)) }
          },
          methods = {
            { "BindKey", 0x48E, BindKey, out.Slipe.Server.Peds.Player, System.String, System.Int32, System.String, System.Boolean },
            { "BindKey", 0x48E, BindKey1, out.Slipe.Server.Peds.Player, System.String, System.Int32, System.Delegate(out.Slipe.Server.Peds.Player, System.String, System.Int32, System.Void), System.Boolean },
            { "UnbindKey", 0x48E, UnbindKey, out.Slipe.Server.Peds.Player, System.String, System.Int32, System.String, System.Boolean },
            { "UnbindKey", 0x48E, UnbindKey1, out.Slipe.Server.Peds.Player, System.String, System.Int32, System.Delegate(out.Slipe.Server.Peds.Player, System.String, System.Int32, System.Void), System.Boolean }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
