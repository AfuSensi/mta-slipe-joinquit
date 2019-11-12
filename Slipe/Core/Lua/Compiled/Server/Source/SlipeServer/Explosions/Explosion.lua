-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Server.Explosions", function (namespace)
  -- <summary>
  -- An explosion in the world
  -- </summary>
  namespace.class("Explosion", function (namespace)
    local Create
    -- <summary>
    -- Creates an explosion at a certain position of a certain type
    -- </summary>
    Create = function (position, type, creator)
      local default = creator
      if default ~= nil then
        default = default:getMTAElement()
      end
      return SlipeMtaDefinitions.MtaServer.CreateExplosion(position.X, position.Y, position.Z, type, default)
    end
    return {
      Create = Create,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x1, nil },
            { "Create", 0x38E, Create, System.Numerics.Vector3, System.Int32, out.Slipe.Shared.Elements.Element, System.Boolean }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
