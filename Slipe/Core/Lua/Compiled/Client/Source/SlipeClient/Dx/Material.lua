-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SystemNumerics
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.Dx", function (namespace)
  -- <summary>
  -- Class representing a texture or shader
  -- </summary>
  namespace.class("Material", function (namespace)
    local getMaterialElement, getMaterialSize, getVolumeSize
    getMaterialElement = function (this)
      return this.materialElement
    end
    getMaterialSize = function (this)
      local result = SlipeMtaDefinitions.MtaClient.DxGetMaterialSize(this.materialElement)
      return SystemNumerics.Vector2(result[1], result[2])
    end
    getVolumeSize = function (this)
      local result = SlipeMtaDefinitions.MtaClient.DxGetMaterialSize(this.materialElement)
      return SystemNumerics.Vector3(result[1], result[2], result[3])
    end
    return {
      getMaterialElement = getMaterialElement,
      getMaterialSize = getMaterialSize,
      getVolumeSize = getVolumeSize,
      __metadata__ = function (out)
        return {
          fields = {
            { "materialElement", 0x3, out.Slipe.MtaDefinitions.MtaElement }
          },
          properties = {
            { "MaterialElement", 0x206, out.Slipe.MtaDefinitions.MtaElement, getMaterialElement },
            { "MaterialSize", 0x206, System.Numerics.Vector2, getMaterialSize },
            { "VolumeSize", 0x206, System.Numerics.Vector3, getVolumeSize }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
