local require_plugin = require("core.helpers").require_plugin

local impatient = require_plugin("impatient")
if not impatient then
    return
end
