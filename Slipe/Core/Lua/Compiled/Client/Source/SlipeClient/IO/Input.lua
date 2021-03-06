-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeSharedIO
local DictDelegateDelegate
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeSharedIO = Slipe.Shared.IO
  DictDelegateDelegate = System.Dictionary(System.Delegate, System.Delegate)
end)
System.namespace("Slipe.Client.IO", function (namespace)
  -- <summary>
  -- Class that handles various types of user input
  -- </summary>
  namespace.class("Input", function (namespace)
    local closures, BindKey, UnbindKey, BindKey1, UnbindKey1, IsKeyPressed, GetAnalogControlState, SetAnalogControlState, 
    SetControlEnabled, IsControlEnabled, SetAllControlsEnabled, KeyboardReadingLayout, static
    static = function (this)
      closures = DictDelegateDelegate()
    end
    -- <summary>
    -- Binds a key to a command
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="command"></param>
    -- <returns></returns>
    BindKey = function (key, state, command)
      return SlipeMtaDefinitions.MtaClient.BindKey(key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), command)
    end
    -- <summary>
    -- Unbinds a key from a command
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="command"></param>
    -- <returns></returns>
    UnbindKey = function (key, state, command)
      return SlipeMtaDefinitions.MtaClient.UnbindKey(key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), command)
    end
    -- <summary>
    -- Binds a key to a method
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="handler"></param>
    -- <returns></returns>
    BindKey1 = function (key, state, handler)
      local rawClosure = function (command, state)
        handler(command, System.Enum.Parse(state, System.Int32))
      end
      closures:set(handler, rawClosure)
      return SlipeMtaDefinitions.MtaClient.BindKey(key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), rawClosure)
    end
    -- <summary>
    -- Unbinds a key from a method
    -- </summary>
    -- <param name="key"></param>
    -- <param name="state"></param>
    -- <param name="handler"></param>
    -- <returns></returns>
    UnbindKey1 = function (key, state, handler)
      if closures:ContainsKey(handler) then
        local result = SlipeMtaDefinitions.MtaClient.UnbindKey(key, state:ToEnumString(SlipeSharedIO.KeyState):ToLower(), closures:get(handler))
        closures:RemoveKey(handler)
        return result
      end
      return false
    end
    -- <summary>
    -- Returns current state of a key
    -- </summary>
    -- <returns></returns>
    IsKeyPressed = function (keyName)
      return SlipeMtaDefinitions.MtaClient.GetKeyState(keyName)
    end
    -- <summary>
    -- Gets analog control state
    -- </summary>
    -- <returns></returns>
    GetAnalogControlState = function (control)
      return SlipeMtaDefinitions.MtaClient.GetAnalogControlState(control)
    end
    -- <summary>
    -- Sets analog control state
    -- </summary>
    -- <param name="value"></param>
    -- <returns></returns>
    SetAnalogControlState = function (control, value)
      return SlipeMtaDefinitions.MtaClient.SetAnalogControlState(control, value)
    end
    -- <summary>
    -- Enables / disabled a control
    -- </summary>
    -- <param name="value"></param>
    -- <returns></returns>
    SetControlEnabled = function (control, value)
      return SlipeMtaDefinitions.MtaClient.ToggleControl(control, value)
    end
    -- <summary>
    -- Gets whether a control is currently enabled
    -- </summary>
    -- <returns></returns>
    IsControlEnabled = function (control)
      return SlipeMtaDefinitions.MtaClient.IsControlEnabled(control)
    end
    -- <summary>
    -- Enables / disables all controls
    -- </summary>
    -- <param name="mtaControls"></param>
    -- <param name="gtaControls"></param>
    -- <returns></returns>
    SetAllControlsEnabled = function (value, mtaControls, gtaControls)
      return SlipeMtaDefinitions.MtaClient.ToggleAllControls(value, gtaControls, mtaControls)
    end
    -- <summary>
    -- This method gets the player's keyboard layout settings, which they are currently (keyboard layout can be changed at any moment) using at the time of invocation.
    -- </summary>
    KeyboardReadingLayout = function ()
      return SlipeMtaDefinitions.MtaClient.GetKeyboardReadingLayout()
    end
    return {
      BindKey = BindKey,
      UnbindKey = UnbindKey,
      BindKey1 = BindKey1,
      UnbindKey1 = UnbindKey1,
      IsKeyPressed = IsKeyPressed,
      GetAnalogControlState = GetAnalogControlState,
      SetAnalogControlState = SetAnalogControlState,
      SetControlEnabled = SetControlEnabled,
      IsControlEnabled = IsControlEnabled,
      SetAllControlsEnabled = SetAllControlsEnabled,
      KeyboardReadingLayout = KeyboardReadingLayout,
      static = static,
      __metadata__ = function (out)
        return {
          fields = {
            { "closures", 0x9, System.Dictionary(System.Delegate(System.String, System.Int32, System.Void), System.Delegate(System.String, System.String, System.Void)) }
          },
          methods = {
            { "BindKey", 0x38E, BindKey, System.String, System.Int32, System.String, System.Boolean },
            { "BindKey", 0x38E, BindKey1, System.String, System.Int32, System.Delegate(System.String, System.Int32, System.Void), System.Boolean },
            { "GetAnalogControlState", 0x18E, GetAnalogControlState, System.String, System.Single },
            { "IsControlEnabled", 0x18E, IsControlEnabled, System.String, System.Boolean },
            { "IsKeyPressed", 0x18E, IsKeyPressed, System.String, System.Boolean },
            { "KeyboardReadingLayout", 0x8E, KeyboardReadingLayout, System.String },
            { "SetAllControlsEnabled", 0x38E, SetAllControlsEnabled, System.Boolean, System.Boolean, System.Boolean, System.Boolean },
            { "SetAnalogControlState", 0x28E, SetAnalogControlState, System.String, System.Single, System.Boolean },
            { "SetControlEnabled", 0x28E, SetControlEnabled, System.String, System.Boolean, System.Boolean },
            { "UnbindKey", 0x38E, UnbindKey, System.String, System.Int32, System.String, System.Boolean },
            { "UnbindKey", 0x38E, UnbindKey1, System.String, System.Int32, System.Delegate(System.String, System.Int32, System.Void), System.Boolean }
          },
          events = {
            { "OnKey", 0xE, System.Delegate(out.Slipe.Client.Elements.RootElement, out.Slipe.Client.IO.Events.OnKeyEventArgs, System.Void) },
            { "OnCharacter", 0xE, System.Delegate(out.Slipe.Client.Elements.RootElement, out.Slipe.Client.IO.Events.OnCharacterEventArgs, System.Void) }
          },
          class = { 0xE }
        }
      end
    }
  end)
end)
