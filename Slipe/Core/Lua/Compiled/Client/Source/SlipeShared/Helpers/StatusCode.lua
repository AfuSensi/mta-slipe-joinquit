-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Shared.Helpers", function (namespace)
  -- <summary>
  -- Represents a status code for the player screenshot event
  -- </summary>
  namespace.enum("StatusCode", function ()
    return {
      Ok = 0,
      Disabled = 1,
      Minimized = 2
    }
  end)

  -- <summary>
  -- Represents a status code for the player network status event
  -- </summary>
  namespace.enum("NetworkInteruptionStatus", function ()
    return {
      Begin = 0,
      End = 1
    }
  end)
end)