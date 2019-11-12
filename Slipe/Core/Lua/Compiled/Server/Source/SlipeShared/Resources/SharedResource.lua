-- Generated by CSharp.lua Compiler
local System = System
local SlipeExports
local SlipeMtaDefinitions
local SlipeSharedElements
local SystemXml
System.import(function (out)
  SlipeExports = Slipe.Exports
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  SystemXml = System.Xml
end)
System.namespace("Slipe.Shared.Resources", function (namespace)
  -- <summary>
  -- Represents an MTA resource
  -- </summary>
  namespace.class("SharedResource", function (namespace)
    local getName, getDynamicRoot, getRoot, getState, getExportedFunctions, Config, Invoke
    getName = function (this)
      return SlipeMtaDefinitions.MtaShared.GetResourceName(this.MtaResource)
    end
    getDynamicRoot = function (this)
      return SlipeSharedElements.ElementManager.getInstance():GetElement1(SlipeMtaDefinitions.MtaShared.GetResourceDynamicElementRoot(this.MtaResource))
    end
    getRoot = function (this)
      return SlipeSharedElements.ElementManager.getInstance():GetElement1(SlipeMtaDefinitions.MtaShared.GetResourceRootElement(this.MtaResource))
    end
    getState = function (this)
      return SlipeMtaDefinitions.MtaShared.GetResourceState(this.MtaResource)
    end
    getExportedFunctions = function (this)
      return SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaShared.GetResourceExportedFunctions(this.MtaResource), "System.String", T)
    end
    -- <summary>
    -- This function is used to return the root node of a configuration file.
    -- </summary>
    Config = function (this, filePath)
      local mtaNode = SlipeMtaDefinitions.MtaShared.GetResourceConfig(filePath)

      local document = SystemXml.XmlDocument()
      local xmlNode = document:CreateElement(SlipeMtaDefinitions.MtaShared.XmlNodeGetName(mtaNode))
      xmlNode:index(mtaNode)
      return xmlNode
    end
    Invoke = function (this, functionName, parameters)
      do
       local export = exports[this:getName()]
          return export[functionName](export, unpack(parameters))	
      end
      return SlipeExports.Export.Invoke(getName(this), functionName, parameters)
    end
    return {
      getName = getName,
      getDynamicRoot = getDynamicRoot,
      getRoot = getRoot,
      getState = getState,
      getExportedFunctions = getExportedFunctions,
      Config = Config,
      Invoke = Invoke,
      __metadata__ = function (out)
        return {
          properties = {
            { "DynamicRoot", 0x206, out.Slipe.Shared.Elements.Element, getDynamicRoot },
            { "ExportedFunctions", 0x206, System.Array(System.String), getExportedFunctions },
            { "MtaResource", 0x3, out.Slipe.MtaDefinitions.MtaResource },
            { "Name", 0x206, System.String, getName },
            { "Root", 0x206, out.Slipe.Shared.Elements.Element, getRoot },
            { "State", 0x206, System.String, getState }
          },
          methods = {
            { "Config", 0x186, Config, System.String, System.Xml.XmlNode },
            { "Invoke", 0x286, Invoke, System.String, System.Array(System.Object), System.Object }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
