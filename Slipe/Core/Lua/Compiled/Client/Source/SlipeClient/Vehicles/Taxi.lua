-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientVehicles
local SlipeMtaDefinitions
local SystemNumerics
System.import(function (out)
  SlipeClientVehicles = Slipe.Client.Vehicles
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SystemNumerics = System.Numerics
end)
System.namespace("Slipe.Client.Vehicles", function (namespace)
  -- <summary>
  -- Represents a taxi vehicle
  -- </summary>
  namespace.class("Taxi", function (namespace)
    local getTaxiLightOn, setTaxiLightOn, op_Explicit1, class, __ctor1__, __ctor2__, __ctor3__
    __ctor1__ = function (this, element)
      SlipeClientVehicles.BaseVehicle.__ctor__[1](this, element)
    end
    -- <summary>
    -- Create a plane from a model at a position
    -- </summary>
    __ctor2__ = function (this, model, position)
      __ctor3__(this, model, position:__clone__(), SystemNumerics.Vector3.getZero(), "", 1, 1)
    end
    -- <summary>
    -- Create a plane using all createVehicle arguments
    -- </summary>
    __ctor3__ = function (this, model, position, rotation, numberplate, variant1, variant2)
      SlipeClientVehicles.BaseVehicle.__ctor__[2](this, model, position:__clone__(), rotation:__clone__(), numberplate, variant1, variant2)
    end
    getTaxiLightOn = function (this)
      return SlipeMtaDefinitions.MtaShared.IsVehicleTaxiLightOn(this.element)
    end
    setTaxiLightOn = function (this, value)
      SlipeMtaDefinitions.MtaShared.SetVehicleTaxiLightOn(this.element, value)
    end
    op_Explicit1 = function (vehicle)
      if System.is(SlipeClientVehicles.VehicleModel.FromId(vehicle:getModel()), SlipeClientVehicles.TaxiModel) then
        return class(vehicle:getMTAElement())
      end

      System.throw((System.InvalidCastException("The vehicle is not a taxi")))
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Client.Vehicles.BaseVehicle
        }
      end,
      getTaxiLightOn = getTaxiLightOn,
      setTaxiLightOn = setTaxiLightOn,
      op_Explicit1 = op_Explicit1,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "TaxiLightOn", 0x106, System.Boolean, getTaxiLightOn, setTaxiLightOn }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.Slipe.MtaDefinitions.MtaElement },
            { ".ctor", 0x206, __ctor2__, out.Slipe.Client.Vehicles.TaxiModel, System.Numerics.Vector3 },
            { ".ctor", 0x606, __ctor3__, out.Slipe.Client.Vehicles.TaxiModel, System.Numerics.Vector3, System.Numerics.Vector3, System.String, System.Int32, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)

  -- <summary>
  -- Represents a Taxi model
  -- </summary>
  namespace.class("TaxiModel", function (namespace)
    local __ctor__
    __ctor__ = function (this, id)
      SlipeClientVehicles.VehicleModel.__ctor__(this, id)
    end
    return {
      __inherits__ = function (out)
        return {
          out.Slipe.Client.Vehicles.VehicleModel
        }
      end,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          methods = {
            { ".ctor", 0x104, nil, System.Int32 }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
