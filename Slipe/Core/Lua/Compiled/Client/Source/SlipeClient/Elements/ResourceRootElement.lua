-- Generated by CSharp.lua Compiler
local System = System
local SlipeSharedElements
System.import(function (out)
  SlipeSharedElements = Slipe.Shared.Elements
end)
System.namespace("Slipe.Client.Elements", function (namespace)
  namespace.class("ResourceRootElement", function (namespace)
    local __ctor__
    __ctor__ = function (this, element)
      SlipeSharedElements.Element.__ctor__[2](this, element)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Elements.Element
        }
      end,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x106, nil, out.Slipe.MtaDefinitions.MtaElement }
          },
          class = { 0x6, System.new(out.Slipe.Shared.Elements.DefaultElementClassAttribute, 2, 35 --[[ElementType.Resource]]) }
        }
      end
    }
  end)
end)