-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
end)
System.namespace("Slipe.Client.Browsers", function (namespace)
  -- <summary>
  -- Class to wrap different types of javascript variables
  -- </summary>
  namespace.class("JavascriptVariable", function (namespace)
    local ToString, op_Implicit, op_Implicit1, op_Implicit2, op_Implicit3, class, __ctor1__, __ctor2__, 
    __ctor3__, __ctor4__, __ctor5__, __ctor6__
    -- <summary>
    -- An empty js variable
    -- </summary>
    __ctor1__ = function (this)
      this.stringRepresentation = "null"
    end
    -- <summary>
    -- A js string variable
    -- </summary>
    __ctor2__ = function (this, value)
      this.stringRepresentation = "\"" .. value .. "\""
    end
    -- <summary>
    -- A js bool variable
    -- </summary>
    __ctor3__ = function (this, value)
      this.stringRepresentation = value:ToString():ToLower()
    end
    -- <summary>
    -- A js integer variable
    -- </summary>
    __ctor4__ = function (this, value)
      this.stringRepresentation = value:ToString()
    end
    -- <summary>
    -- A js float variable
    -- </summary>
    __ctor5__ = function (this, value)
      this.stringRepresentation = value:ToString()
    end
    -- <summary>
    -- Any MTA variable cast to a json
    -- </summary>
    __ctor6__ = function (this, value)
      this.stringRepresentation = SlipeMtaDefinitions.MtaShared.ToJSON(value, false, "none")
      -- remove MTA's stupid wrapping of JSONs
      this.stringRepresentation = this.stringRepresentation:Substring(1, #this.stringRepresentation - 2)
    end
    ToString = function (this)
      return this.stringRepresentation
    end
    op_Implicit = function (value)
      return System.new(class, 2, value)
    end
    op_Implicit1 = function (value)
      return System.new(class, 3, value)
    end
    op_Implicit2 = function (value)
      return System.new(class, 4, value)
    end
    op_Implicit3 = function (value)
      return System.new(class, 5, value)
    end
    class = {
      ToString = ToString,
      op_Implicit = op_Implicit,
      op_Implicit1 = op_Implicit1,
      op_Implicit2 = op_Implicit2,
      op_Implicit3 = op_Implicit3,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__,
        __ctor4__,
        __ctor5__,
        __ctor6__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "stringRepresentation", 0x1, System.String }
          },
          methods = {
            { ".ctor", 0x6, __ctor1__ },
            { ".ctor", 0x106, __ctor2__, System.String },
            { ".ctor", 0x106, __ctor3__, System.Boolean },
            { ".ctor", 0x106, __ctor4__, System.Int32 },
            { ".ctor", 0x106, __ctor5__, System.Single },
            { ".ctor", 0x106, __ctor6__, System.Object },
            { "ToString", 0x86, ToString, System.String }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)
