-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Shared.IO", function (namespace)
  -- <summary>
  -- Represents different mouse buttons
  -- </summary>
  namespace.enum("MouseButton", function ()
    return {
      Left = 0,
      Middle = 1,
      Right = 2
    }
  end)

  -- <summary>
  -- Represents different mouse button states
  -- </summary>
  namespace.enum("MouseButtonState", function ()
    return {
      Up = 0,
      Down = 1
    }
  end)

  -- <summary>
  -- Represents the scroll direction of the mouse wheel
  -- </summary>
  namespace.enum("MouseWheelState", function ()
    return {
      Down = -1,
      Up = 1
    }
  end)
end)