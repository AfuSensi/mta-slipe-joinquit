-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Server.IO", function (namespace)
  namespace.class("ServerLog", function (namespace)
    local WriteLine
    WriteLine = function (this, line)
      SlipeMtaDefinitions.MtaServer.OutputServerLog(line)
    end
    return {
      WriteLine = WriteLine,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x4, nil },
            { "WriteLine", 0x106, WriteLine, System.String }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
