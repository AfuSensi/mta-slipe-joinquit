-- Generated by CSharp.lua Compiler
local System = System
local SlipeSharedElements
System.import(function (out)
  SlipeSharedElements = Slipe.Shared.Elements
end)
System.namespace("Slipe.Client.Elements", function (namespace)
  namespace.class("RootElement", function (namespace)
    local HandleEvent, class, __ctor__
    __ctor__ = function (this, element)
      SlipeSharedElements.Element.__ctor__[2](this, element)
    end
    HandleEvent = function (this, eventName, element, p1, p2, p3, p4, p5, p6, p7, p8)
      local default = class.OnMiscelaniousEvent
      if default ~= nil then
        default(eventName, element, p1, p2, p3, p4, p5, p6, p7, p8)
      end
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.Element
        }
      end,
      HandleEvent = HandleEvent,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x106, nil, out.Slipe.MtaDefinitions.MtaElement },
            { "HandleEvent", 0xA06, HandleEvent, System.String, out.Slipe.MtaDefinitions.MtaElement, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object }
          },
          events = {
            { "OnMiscelaniousEvent", 0xE, System.Delegate(System.String, out.Slipe.MtaDefinitions.MtaElement, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object, System.Object, System.Void) }
          },
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 36 --[[ElementType.Root]]) }
        }
      end
    }
    return class
  end)
end)
