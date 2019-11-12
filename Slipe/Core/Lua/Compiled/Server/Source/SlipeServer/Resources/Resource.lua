-- Generated by CSharp.lua Compiler
local System = System
local SlipeMtaDefinitions
local SlipeServerGame
local SlipeServerResources
local SlipeSharedElements
local SystemXml
local ArrayResource
local DictObjectResource
System.import(function (out)
  SlipeMtaDefinitions = Slipe.MtaDefinitions
  SlipeServerGame = Slipe.Server.Game
  SlipeServerResources = Slipe.Server.Resources
  SlipeSharedElements = Slipe.Shared.Elements
  SystemXml = System.Xml
  ArrayResource = System.Array(SlipeServerResources.Resource)
  DictObjectResource = System.Dictionary(System.Object, SlipeServerResources.Resource)
end)
System.namespace("Slipe.Server.Resources", function (namespace)
  -- <summary>
  -- Represents an MTA resource
  -- </summary>
  namespace.class("Resource", function (namespace)
    local resources, getLastStartTime, getLoadFailureReason, getLoadTime, getOrganizationalPath, getIsArchived, getACLRequests, thisResource, 
    getThis, getAll, UpdateACLRequest, MapRoot, AddConfig, AddMap, Delete, Refresh, 
    RemoveFile, Rename, Restart, GetInfo, SetInfo, Start, Stop, CopyFrom, 
    RefreshAll, Get, Get1, CastMultiple, class, static, __ctor1__, __ctor2__, 
    __ctor3__
    static = function (this)
      resources = DictObjectResource()
    end
    -- <summary>
    -- Create a resource from an MTA resource element
    -- </summary>
    __ctor1__ = function (this, resource)
      resources:AddKeyValue(resource, this)
      this.MtaResource = resource

      SlipeServerGame.GameServer.OnStart = SlipeServerGame.GameServer.OnStart + function (source, eventArgs)
        if eventArgs.Resource.MtaResource ~= this.MtaResource then
          return
        end
        local default = this.OnStart
        if default ~= nil then
          default()
        end
      end

      SlipeServerGame.GameServer.OnPreStart = SlipeServerGame.GameServer.OnPreStart + function (source, eventArgs)
        if eventArgs.Resource.MtaResource ~= this.MtaResource then
          return
        end
        local default = this.OnPreStart
        if default ~= nil then
          default()
        end
      end

      SlipeServerGame.GameServer.OnStop = SlipeServerGame.GameServer.OnStop + function (source, eventArgs)
        if eventArgs.Resource.MtaResource ~= this.MtaResource then
          return
        end
        local default = this.OnStop
        if default ~= nil then
          default()
        end
      end
    end
    -- <summary>
    -- Only used to extend a specific resource class
    -- </summary>
    __ctor2__ = function (this, name)
      __ctor1__(this, SlipeMtaDefinitions.MtaShared.GetResourceFromName(name))
    end
    -- <summary>
    -- Create a new empty resource
    -- </summary>
    __ctor3__ = function (this, name, organizationalDir)
      __ctor1__(this, SlipeMtaDefinitions.MtaServer.CreateResource(name, organizationalDir))
    end
    getLastStartTime = function (this)
      return SlipeMtaDefinitions.MtaShared.GetDateTimeFromSecondStamp(SlipeMtaDefinitions.MtaServer.GetResourceLastStartTime(this.MtaResource))
    end
    getLoadFailureReason = function (this)
      return SlipeMtaDefinitions.MtaServer.GetResourceLoadFailureReason(this.MtaResource)
    end
    getLoadTime = function (this)
      return SlipeMtaDefinitions.MtaShared.GetDateTimeFromSecondStamp(SlipeMtaDefinitions.MtaServer.GetResourceLoadTime(this.MtaResource))
    end
    getOrganizationalPath = function (this)
      return SlipeMtaDefinitions.MtaServer.GetResourceOrganizationalPath(this.MtaResource)
    end
    getIsArchived = function (this)
      return SlipeMtaDefinitions.MtaServer.IsResourceArchived(this.MtaResource)
    end
    getACLRequests = function (this)
      return SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetResourceACLRequests(this.MtaResource), "acl-request", T)
    end
    getThis = function ()
      thisResource = thisResource or Get1(SlipeMtaDefinitions.MtaShared.GetThisResource())
      return thisResource
    end
    getAll = function ()
      local resourceList = SlipeMtaDefinitions.MtaShared.GetArrayFromTable(SlipeMtaDefinitions.MtaServer.GetResources(), "mta-resource", T)
      return CastMultiple(resourceList)
    end
    -- <summary>
    -- This function changes the access for one ACL request of the given resource.
    -- </summary>
    UpdateACLRequest = function (this, rightName, access, byWho)
      return SlipeMtaDefinitions.MtaServer.UpdateResourceACLRequest(this.MtaResource, rightName, access, byWho)
    end
    -- <summary>
    -- This function retrieves the root element of a certain map in this resource
    -- </summary>
    MapRoot = function (this, mapName)
      return SlipeSharedElements.ElementManager.getInstance():GetElement1(SlipeMtaDefinitions.MtaServer.GetResourceMapRootElement(this.MtaResource, mapName))
    end
    -- <summary>
    -- Adds a new config to this resource
    -- </summary>
    AddConfig = function (this, filePath, fileType)
      local mtaNode = SlipeMtaDefinitions.MtaServer.AddResourceConfig(filePath, fileType)

      local document = SystemXml.XmlDocument()
      local xmlNode = document:CreateElement(SlipeMtaDefinitions.MtaShared.XmlNodeGetName(mtaNode))
      xmlNode:index(mtaNode)
      return xmlNode
    end
    -- <summary>
    -- This function adds a new empty mapfile to this resource
    -- </summary>
    AddMap = function (this, filePath, dimension)
      local mtaNode = SlipeMtaDefinitions.MtaServer.AddResourceMap(filePath, dimension)

      local document = SystemXml.XmlDocument()
      local xmlNode = document:CreateElement(SlipeMtaDefinitions.MtaShared.XmlNodeGetName(mtaNode))
      xmlNode:index(mtaNode)
      return xmlNode
    end
    -- <summary>
    -- This function deletes this resource from the MTA memory and moves it to the /resources-cache/trash/ directory.
    -- </summary>
    Delete = function (this)
      return SlipeMtaDefinitions.MtaServer.DeleteResource(this:getName())
    end
    -- <summary>
    -- Refreshes the current resource
    -- </summary>
    Refresh = function (this)
      return SlipeMtaDefinitions.MtaServer.RefreshResources(true, this.MtaResource)
    end
    -- <summary>
    -- This function removes a file from the resource.
    -- </summary>
    RemoveFile = function (this, fileName)
      return SlipeMtaDefinitions.MtaServer.RemoveResourceFile(this.MtaResource, fileName)
    end
    -- <summary>
    -- This function renames a resource.
    -- </summary>
    Rename = function (this, newName, organizationalPath)
      return SlipeMtaDefinitions.MtaServer.RenameResource(this:getName(), newName, organizationalPath)
    end
    -- <summary>
    -- This function restarts a running resource. Restarting will destroy all the elements that the resource has created (as stopping the resource does).
    -- </summary>
    Restart = function (this, persistent, configs, maps, scripts, html, clientConfigs, clientScripts, clientFiles)
      return SlipeMtaDefinitions.MtaServer.RestartResource(this.MtaResource, persistent, configs, maps, scripts, html, clientConfigs, clientScripts, clientFiles)
    end
    -- <summary>
    -- This function retrieves the value of any attribute in a resource info tag.
    -- </summary>
    GetInfo = function (this, attribute)
      return SlipeMtaDefinitions.MtaServer.GetResourceInfo(this.MtaResource, attribute)
    end
    -- <summary>
    -- This function sets the value of any attribute in a resource info tag.
    -- </summary>
    SetInfo = function (this, attribute, value)
      return SlipeMtaDefinitions.MtaServer.SetResourceInfo(this.MtaResource, attribute, value)
    end
    -- <summary>
    -- This function starts a resource either persistently or as a dependency of the current resource.
    -- </summary>
    Start = function (this, persistent, includedResources, configs, maps, scripts, html, clientConfigs, clientScripts, clientFiles)
      return SlipeMtaDefinitions.MtaServer.StartResource(this.MtaResource, persistent, includedResources, configs, maps, scripts, html, clientConfigs, clientScripts, clientFiles)
    end
    -- <summary>
    -- This function stops a running resource.
    -- </summary>
    Stop = function (this)
      return SlipeMtaDefinitions.MtaServer.StopResource(this.MtaResource)
    end
    -- <summary>
    -- This function copies a specified resource with a new name
    -- </summary>
    CopyFrom = function (resource, name, organizationalDir)
      return Get1(SlipeMtaDefinitions.MtaServer.CopyResource(resource.MtaResource, name, organizationalDir))
    end
    -- <summary>
    -- This function finds new resources and checks for changes to the current ones.
    -- </summary>
    RefreshAll = function ()
      return SlipeMtaDefinitions.MtaServer.RefreshResources(true)
    end
    -- <summary>
    -- This function is used to retrieve a resource from its name. A resource's name is the same as its folder or file archive name on the server (without the extension).
    -- </summary>
    Get = function (name)
      return Get1(SlipeMtaDefinitions.MtaShared.GetResourceFromName(name))
    end
    Get1 = function (resource)
      if resource == nil then
        return nil
      end
      if not resources:ContainsKey(resource) then
        return class(resource)
      end
      return resources:get(resource)
    end
    CastMultiple = function (_resources)
      local result = ArrayResource:new(#_resources)
      for i = 0, #_resources - 1 do
        result:set(i, Get1(_resources:get(i)))
      end
      return result
    end
    class = {
      __inherits__ = function (out)
        return {
          out.Slipe.Shared.Resources.SharedResource
        }
      end,
      getLastStartTime = getLastStartTime,
      getLoadFailureReason = getLoadFailureReason,
      getLoadTime = getLoadTime,
      getOrganizationalPath = getOrganizationalPath,
      getIsArchived = getIsArchived,
      getACLRequests = getACLRequests,
      getThis = getThis,
      getAll = getAll,
      UpdateACLRequest = UpdateACLRequest,
      MapRoot = MapRoot,
      AddConfig = AddConfig,
      AddMap = AddMap,
      Delete = Delete,
      Refresh = Refresh,
      RemoveFile = RemoveFile,
      Rename = Rename,
      Restart = Restart,
      GetInfo = GetInfo,
      SetInfo = SetInfo,
      Start = Start,
      Stop = Stop,
      CopyFrom = CopyFrom,
      RefreshAll = RefreshAll,
      Get = Get,
      Get1 = Get1,
      CastMultiple = CastMultiple,
      static = static,
      __ctor__ = {
        __ctor1__,
        __ctor2__,
        __ctor3__
      },
      __metadata__ = function (out)
        return {
          fields = {
            { "resources", 0x9, System.Dictionary(System.Object, out.Slipe.Server.Resources.Resource) },
            { "thisResource", 0x9, class }
          },
          properties = {
            { "ACLRequests", 0x206, System.Array(out.Slipe.Server.Acl.AclRequest), getACLRequests },
            { "All", 0x20E, System.Array(out.Slipe.Server.Resources.Resource), getAll },
            { "IsArchived", 0x206, System.Boolean, getIsArchived },
            { "LastStartTime", 0x206, System.DateTime, getLastStartTime },
            { "LoadFailureReason", 0x206, System.String, getLoadFailureReason },
            { "LoadTime", 0x206, System.DateTime, getLoadTime },
            { "OrganizationalPath", 0x206, System.String, getOrganizationalPath },
            { "This", 0x20E, class, getThis }
          },
          methods = {
            { ".ctor", 0x103, __ctor1__, out.Slipe.MtaDefinitions.MtaResource },
            { ".ctor", 0x103, __ctor2__, System.String },
            { ".ctor", 0x206, __ctor3__, System.String, System.String },
            { "AddConfig", 0x286, AddConfig, System.String, System.String, System.Xml.XmlNode },
            { "AddMap", 0x286, AddMap, System.String, System.Int32, System.Xml.XmlNode },
            { "CastMultiple", 0x18C, CastMultiple, System.Array(out.Slipe.MtaDefinitions.MtaResource), System.Array(out.Slipe.Server.Resources.Resource) },
            { "CopyFrom", 0x38E, CopyFrom, class, System.String, System.String, class },
            { "Delete", 0x86, Delete, System.Boolean },
            { "Get", 0x18C, Get1, out.Slipe.MtaDefinitions.MtaResource, class },
            { "Get", 0x18E, Get, System.String, class },
            { "GetInfo", 0x186, GetInfo, System.String, System.String },
            { "MapRoot", 0x186, MapRoot, System.String, out.Slipe.Shared.Elements.Element },
            { "Refresh", 0x86, Refresh, System.Boolean },
            { "RefreshAll", 0x8E, RefreshAll, System.Boolean },
            { "RemoveFile", 0x186, RemoveFile, System.String, System.Boolean },
            { "Rename", 0x286, Rename, System.String, System.String, System.Boolean },
            { "Restart", 0x886, Restart, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean },
            { "SetInfo", 0x286, SetInfo, System.String, System.String, System.Boolean },
            { "Start", 0x986, Start, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean },
            { "Stop", 0x86, Stop, System.Boolean },
            { "UpdateACLRequest", 0x386, UpdateACLRequest, System.String, System.Boolean, System.String, System.Boolean }
          },
          events = {
            { "OnPreStart", 0x6, System.Delegate },
            { "OnStart", 0x6, System.Delegate },
            { "OnStop", 0x6, System.Delegate }
          },
          class = { 0x6 }
        }
      end
    }
    return class
  end)
end)