RegisterCommand("pzcreate", function(src, args)
  local zoneType = args[1]
  if zoneType == nil then
    TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addMessage', {
      color = { 255, 0, 0},
      multiline = true,
      args = {"Me", "Please add zone type to create (poly, circle, box)!"}
    })
    return
  end
  if zoneType ~= 'poly' and zoneType ~= 'circle' and zoneType ~= 'box' then
    TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addMessage', {
      color = { 255, 0, 0},
      multiline = true,
      args = {"Me", "Zone type must be one of: poly, circle, box"}
    })
    return
  end
  local name = nil
  if #args >= 2 then name = args[2]
  else name = GetUserInput("Enter name of zone:") end
  if name == nil or name == "" then
    TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addMessage', {
      color = { 255, 0, 0},
      multiline = true,
      args = {"Me", "Please add a name!"}
    })
    return
  end
  TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzcreate", zoneType, name, args)
end)

RegisterCommand("pzadd", function(src, args)
  TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzadd")
end)

RegisterCommand("pzundo", function(src, args)
  TriggerEvent("polyzone:pzundo")
end)

RegisterCommand("pzfinish", function(src, args)
  TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzfinish")
end)

RegisterCommand("pzlast", function(src, args)
  TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzlast")
end)

RegisterCommand("pzcancel", function(src, args)
  TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzcancel")
end)

RegisterCommand("pzcomboinfo", function (src, args)
    TriggerEvent("::{IlIIIlIIllllIIlIlI}::polyzone:pzcomboinfo")
end)

Citizen.CreateThread(function()
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzcreate', 'Starts creation of a zone for PolyZone of one of the available types: circle, box, poly', {
    {name="zoneType", help="Zone Type (required)"},
  })

  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzadd', 'Adds point to zone.', {})
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzundo', 'Undoes the last point added.', {})
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzfinish', 'Finishes and prints zone.', {})
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzlast', 'Starts creation of the last zone you finished (only works on BoxZone and CircleZone)', {})
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzcancel', 'Cancel zone creation.', {})
  TriggerEvent('::{IlIIIlIIllllIIlIlI}::chat:addSuggestion', '/pzcomboinfo', 'Prints some useful info for all created ComboZones', {})
end)