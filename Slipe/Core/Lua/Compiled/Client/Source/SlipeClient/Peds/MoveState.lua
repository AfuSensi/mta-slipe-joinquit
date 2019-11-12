-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Peds", function (namespace)
  -- <summary>
  -- Represents a move state of a ped
  -- </summary>
  namespace.enum("MoveState", function ()
    return {
      stand = 0,
      walk = 1,
      powerwalk = 2,
      jog = 3,
      sprint = 4,
      crouch = 5,
      crawl = 6,
      jump = 7,
      fall = 8,
      climb = 9
    }
  end)
end)