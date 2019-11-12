-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Shared.GameWorld", function (namespace)
  -- <summary>
  -- Class wrapping a garage as seen in singleplayer
  -- </summary>
  namespace.class("SharedGarage", function (namespace)
    local getOpen, setOpen, __ctor__
    -- <summary>
    -- Create a garage instance from the garage ID
    -- </summary>
    __ctor__ = function (this, garageID)
      this._garageID = garageID
    end
    getOpen = function (this)
      return SlipeMtaDefinitions.MtaShared.IsGarageOpen(this._garageID)
    end
    setOpen = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetGarageOpen(this._garageID, value)
    end
    return {
      _garageID = 0,
      getOpen = getOpen,
      setOpen = setOpen,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          fields = {
            { "_garageID", 0x3, System.Int32 }
          },
          properties = {
            { "Open", 0x106, System.Boolean, getOpen, setOpen }
          },
          methods = {
            { ".ctor", 0x106, nil, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)