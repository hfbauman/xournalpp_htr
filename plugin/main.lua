function initUi()
  app.registerUi({["menu"] = "Xournal++ HTR", ["callback"] = "run", ["accelerator"] = "<Control>F1"});
end
  
function run()

  -- Read settings: I use this (https://stackoverflow.com/a/41176958). An
  -- alternative could have been https://stackoverflow.com/a/41176826. Both
  -- found using G"lua read settings file".
  local config = require "config"

  local result = app.msgbox("Exports starts now, please wait until finished", {[1] = "Continue", [2] = "Cancel"})
  if result == 1 then
    command = config.python_executable .. " " .. config.xournalpp_htr_path
              .. " -if " .. config.filename
              .. "  -m " .. config.model
              .. " -of " .. config.output_file
    os.execute(command)
    app.msgbox("Export finished!", {[1] = "Continue"})
  end

  return
end

-- TODO: Think of workflow to maximise usability for user
-- TODO: How to store settings? Ideally permanently?
-- TODO: Interesting code from example plugins:
--   - Get filename: https://github.com/xournalpp/xournalpp/blob/master/plugins/Export/main.lua#L29
--   - Toggle logic: https://github.com/xournalpp/xournalpp/blob/master/plugins/HighlightPosition/main.lua#L5
--   - UI: https://github.com/xournalpp/xournalpp/blob/master/plugins/MigrateFontSizes/main.lua
--   - OS interaction: https://github.com/xournalpp/xournalpp/blob/master/plugins/QuickScreenshot/main.lua
