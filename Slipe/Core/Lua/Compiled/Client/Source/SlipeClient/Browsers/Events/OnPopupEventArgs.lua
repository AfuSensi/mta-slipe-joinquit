-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.Browsers.Events", function (namespace)
  namespace.class("OnPopupEventArgs", function (namespace)
    local __ctor__
    __ctor__ = function (this, target, opener, isPopup)
      this.Url = System.cast(System.String, target)
      this.Opener = System.cast(System.String, opener)
      this.IsPopup = isPopup
    end
    return {
      IsPopup = false,
      __ctor__ = __ctor__,
      __metadata__ = function (out)
        return {
          properties = {
            { "IsPopup", 0x6, System.Boolean },
            { "Opener", 0x6, System.String },
            { "Url", 0x6, System.String }
          },
          methods = {
            { ".ctor", 0x304, nil, System.Object, System.Object, System.Boolean }
          },
          class = { 0x6 }
        }
      end
    }
  end)
end)
