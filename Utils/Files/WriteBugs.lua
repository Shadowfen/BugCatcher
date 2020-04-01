do
  dofile("../../../SavedVariables/BugCatcher.lua")

  if not bugCatcherAddonDB or type(bugCatcherAddonDB) ~= "table" then return end

  os.remove("./Bugs.txt")

  local file = io.open("./Bugs.txt", "w")

  if #bugCatcherAddonDB == 0 then
    file:write("No errors found.")
    file:close()

    return
  end

  file:write("[[ Bugcatcher Export ]]")

  for errorIndex = 1, #bugCatcherAddonDB do
    file:write("\n\n-- Error #"..tostring(errorIndex).." ["..(bugCatcherAddonDB.count[bugCatcherAddonDB[errorIndex]] or 0).." Duplicate"..(bugCatcherAddonDB.count[bugCatcherAddonDB[errorIndex]] == 1 and "" or "s")..", last seen at "..(bugCatcherAddonDB.time[bugCatcherAddonDB[errorIndex]] or "Unknown Time").."]\n\n"..bugCatcherAddonDB[errorIndex])
  end

  file:write("\n\n< End of File >")

  file:close()

  os.remove("../../../SavedVariables/BugCatcher.lua")

  file = io.open("../../../SavedVariables/BugCatcher.lua", "w")

  file:write("bugCatcherAddonDB =\n{\n    [\"bugPage\"] = 1,\n    [\"count\"] = \n    {\n    },\n    [\"time\"] = \n    {\n    },\n}")
  file:close()
end