-- Generated by CSharp.lua Compiler
local System = System
local SlipeClientPeds
local SlipeClientVehicles
local SlipeMtaDefinitions
local SlipeSharedElements
local SlipeSharedVehicles
local SystemNumerics
local ArrayComponent
local DictInt32Player
System.import(function (out)
  SlipeClientPeds = Slipe.Client.Peds
  SlipeClientVehicles = Slipe.Client.Vehicles
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedElements = Slipe.Shared.Elements
  SlipeSharedVehicles = Slipe.Shared.Vehicles
  SystemNumerics = System.Numerics
  ArrayComponent = System.Array(SlipeClientVehicles.Component)
  DictInt32Player = System.Dictionary(System.Int32, SlipeClientPeds.Player)
end)
System.namespace("Slipe.Client.Vehicles", function (namespace)
  -- <summary>
  -- Abstract class for client-side vehicles
  -- </summary>
  namespace.class("BaseVehicle", function (namespace)
    local getControler, getOccupants, getAdjustableProperty, setAdjustableProperty, getComponents, getCurrentGear, getGravity, setGravity, 
    getNitroCount, setNitroCount, getNitroLevel, setNitroLevel, getNitroActivated, setNitroActivated, getIsNitroRecharging, Blow, 
    GetOccupant, GetComponent, IsWheelOnGround, isWindowOpen, SetWindowOpen, class, __ctor1__, __ctor2__
    __ctor1__ = function (this, element)
      SlipeSharedVehicles.SharedVehicle.__ctor__(this, element)
    end
    -- <summary>
    -- Create a vehicle using all createVehicle arguments
    -- </summary>
    __ctor2__ = function (this, model, position, rotation, numberplate, variant1, variant2)
      __ctor1__(this, SlipeMtaDefinitions.MtaClient.CreateVehicle(model.Id, position.X, position.Y, position.Z, rotation.X, rotation.Y, rotation.Z, numberplate, variant1, variant2))
    end
    getControler = function (this)
      return SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaShared.GetVehicleController(this.element), SlipeClientPeds.Player)
    end
    getOccupants = function (this)
      local elements = SlipeMtaDefinitions.MtaShared.GetDictionaryFromTable(SlipeMtaDefinitions.MtaShared.GetVehicleOccupants(this.element), "System.Int32", "MTAElement")
      local dictionary = DictInt32Player()
      for _, entry in System.each(elements) do
        local p = SlipeSharedElements.ElementManager.getInstance():GetElement(entry.Value, SlipeClientPeds.Player)
        local s = entry.Key
        dictionary:AddKeyValue(s, p)
      end
      return dictionary
    end
    getAdjustableProperty = function (this)
      return SlipeMtaDefinitions.MtaClient.GetVehicleAdjustableProperty(this.element)
    end
    setAdjustableProperty = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetVehicleAdjustableProperty(this.element, value)
    end
    getComponents = function (this)
      local d = SlipeMtaDefinitions.MtaShared.GetDictionaryFromTable(SlipeMtaDefinitions.MtaClient.GetVehicleComponents(this.element), "System.String", "System.Boolean")
      local r = ArrayComponent:new(d:getCount())
      local count = 0
      for _, c in System.each(d) do
        r:set(count, System.new(SlipeClientVehicles.Component, 2, this, c.Key, 1))
        count = count + 1
      end
      return r
    end
    getCurrentGear = function (this)
      return SlipeMtaDefinitions.MtaClient.GetVehicleCurrentGear(this.element)
    end
    getGravity = function (this)
      local r = SlipeMtaDefinitions.MtaClient.GetVehicleGravity(this.element)
      return SystemNumerics.Vector3(r[1], r[2], r[3])
    end
    setGravity = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetVehicleGravity(this.element, value.X, value.Y, value.Z)
    end
    getNitroCount = function (this)
      return SlipeMtaDefinitions.MtaClient.GetVehicleNitroCount(this.element)
    end
    setNitroCount = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetVehicleNitroCount(this.element, value)
    end
    getNitroLevel = function (this)
      return SlipeMtaDefinitions.MtaClient.GetVehicleNitroLevel(this.element)
    end
    setNitroLevel = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetVehicleNitroLevel(this.element, value)
    end
    getNitroActivated = function (this)
      return SlipeMtaDefinitions.MtaClient.IsVehicleNitroActivated(this.element)
    end
    setNitroActivated = function (this, value)
      SlipeMtaDefinitions.MtaClient.SetVehicleNitroActivated(this.element, value)
    end
    getIsNitroRecharging = function (this)
      return SlipeMtaDefinitions.MtaClient.IsVehicleNitroRecharging(this.element)
    end
    -- <summary>
    -- Blow up this vehicle
    -- </summary>
    Blow = function (this)
      return SlipeMtaDefinitions.MtaClient.BlowVehicle(this.element)
    end
    -- <summary>
    -- This function gets the player sitting/trying to enter this vehicle.
    -- </summary>
    GetOccupant = function (this, seat)
      return SlipeSharedElements.ElementManager.getInstance():GetElement(SlipeMtaDefinitions.MtaShared.GetVehicleOccupant(this.element, seat), SlipeClientPeds.Player)
    end
    -- <summary>
    -- Get a specific component of this vehicle
    -- </summary>
    GetComponent = function (this, type, relativeTo)
      return SlipeClientVehicles.Component(this, type, relativeTo)
    end
    -- <summary>
    -- Check if a wheel is touching the ground
    -- </summary>
    IsWheelOnGround = function (this, wheel)
      return SlipeMtaDefinitions.MtaClient.IsVehicleWheelOnGround(this.element, wheel)
    end
    -- <summary>
    -- Check if a window is open
    -- </summary>
    isWindowOpen = function (this, window)
      return SlipeMtaDefinitions.MtaClient.IsVehicleWindowOpen(this.element, window)
    end
    -- <summary>
    -- This function sets the vehicle window state.
    -- </summary>
    SetWindowOpen = function (this, window, open)
      return SlipeMtaDefinitions.MtaClient.SetVehicleWindowOpen(this.element, window, open)
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Vehicles.SharedVehicle
        }
      end,
      getControler = getControler,
      getOccupants = getOccupants,
      getAdjustableProperty = getAdjustableProperty,
      setAdjustableProperty = setAdjustableProperty,
      getComponents = getComponents,
      getCurrentGear = getCurrentGear,
      getGravity = getGravity,
      setGravity = setGravity,
      getNitroCount = getNitroCount,
      setNitroCount = setNitroCount,
      getNitroLevel = getNitroLevel,
      setNitroLevel = setNitroLevel,
      getNitroActivated = getNitroActivated,
      setNitroActivated = setNitroActivated,
      getIsNitroRecharging = getIsNitroRecharging,
      Blow = Blow,
      GetOccupant = GetOccupant,
      GetComponent = GetComponent,
      IsWheelOnGround = IsWheelOnGround,
      isWindowOpen = isWindowOpen,
      SetWindowOpen = SetWindowOpen,
      __ctor__ = {
        __ctor1__,
        __ctor2__
      },
      __metadata__ = function (out)
        return {
          properties = {
            { "AdjustableProperty", 0x106, System.Int32, getAdjustableProperty, setAdjustableProperty },
            { "Components", 0x206, System.Array(out.Slipe.Client.Vehicles.Component), getComponents },
            { "Controler", 0x206, out.Slipe.Client.Peds.Player, getControler },
            { "CurrentGear", 0x206, System.Int32, getCurrentGear },
            { "Gravity", 0x106, System.Numerics.Vector3, getGravity, setGravity },
            { "IsNitroRecharging", 0x206, System.Boolean, getIsNitroRecharging },
            { "NitroActivated", 0x106, System.Boolean, getNitroActivated, setNitroActivated },
            { "NitroCount", 0x106, System.Int32, getNitroCount, setNitroCount },
            { "NitroLevel", 0x106, System.Single, getNitroLevel, setNitroLevel },
            { "Occupants", 0x206, System.Dictionary(System.Int32, out.Slipe.Client.Peds.Player), getOccupants }
          },
          methods = {
            { ".ctor", 0x106, __ctor1__, out.Slipe.MtaDefinitions.MtaElement },
            { ".ctor", 0x603, __ctor2__, out.Slipe.Client.Vehicles.VehicleModel, System.Numerics.Vector3, System.Numerics.Vector3, System.String, System.Int32, System.Int32 },
            { "Blow", 0x86, Blow, System.Boolean },
            { "GetComponent", 0x286, GetComponent, System.Int32, System.Int32, out.Slipe.Client.Vehicles.Component },
            { "GetOccupant", 0x186, GetOccupant, System.Int32, out.Slipe.Client.Peds.Player },
            { "IsWheelOnGround", 0x186, IsWheelOnGround, System.Int32, System.Boolean },
            { "isWindowOpen", 0x186, isWindowOpen, System.Int32, System.Boolean },
            { "SetWindowOpen", 0x286, SetWindowOpen, System.Int32, System.Boolean, System.Boolean }
          },
          events = {
            { "OnCollisionShapeHit", 0x6, System.Delegate(class, out.Slipe.Shared.Elements.Events.OnCollisionShapeHitEventArgs, System.Void) },
            { "OnCollisionShapeLeave", 0x6, System.Delegate(class, out.Slipe.Shared.Elements.Events.OnCollisionShapeLeaveEventArgs, System.Void) },
            { "OnCollision", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnCollisionEventArgs, System.Void) },
            { "OnDamage", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnDamageEventArgs, System.Void) },
            { "OnEnter", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnEnterEventArgs, System.Void) },
            { "OnExit", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnExitEventArgs, System.Void) },
            { "OnStartEnter", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnStartEnterEventArgs, System.Void) },
            { "OnStartExit", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnStartExitEventArgs, System.Void) },
            { "OnExplode", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnExplodeEventArgs, System.Void) },
            { "OnRespawn", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnRespawnEventArgs, System.Void) },
            { "OnNitroStateChange", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnNitroStateChangeEventArgs, System.Void) },
            { "OnExplosion", 0x6, System.Delegate(class, out.Slipe.Client.Elements.Events.OnExplosionEventArgs, System.Void) },
            { "OnWorldSound", 0x6, System.Delegate(class, out.Slipe.Client.Elements.Events.OnWorldSoundEventArgs, System.Void) },
            { "OnWeaponHit", 0x6, System.Delegate(class, out.Slipe.Client.Vehicles.Events.OnWeaponHitEventArgs, System.Void) }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)