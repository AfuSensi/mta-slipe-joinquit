-- Generated by CSharp.lua Compiler
local System = System
local SlipeSharedElements
System.import(function (out)
  SlipeSharedElements = Slipe.Shared.Elements
end)
System.namespace("Slipe.Server.Peds.Events", function (namespace)
  namespace.class("OnContactEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, previousElement, newElement)
      this.PreviousElement = SlipeSharedElements.ElementManager.getInstance():GetElement(previousElement, SlipeSharedElements.PhysicalElement)
      this.NewElement = SlipeSharedElements.ElementManager.getInstance():GetElement(newElement, SlipeSharedElements.PhysicalElement)
    end
    return {
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "NewElement", 0x6, out.Slipe.Shared.Elements.PhysicalElement },
            { "PreviousElement", 0x6, out.Slipe.Shared.Elements.PhysicalElement }
          },
          methods = {
            { ".ctor", 0x204, nil, out.Slipe.MtaDefinitions.MtaElement, out.Slipe.MtaDefinitions.MtaElement }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
