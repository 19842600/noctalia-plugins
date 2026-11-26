--!nonstrict
local Noctalia = require("@noctalia/core")

local UmbrielService = {}

-- Calls the exact action targets from the official Focus/Scrolling spec
function UmbrielService.scroll_left()
    Noctalia.process.execute({
        command = "umbriel",
        args = { "msg", "window-focus-left" }
    })
end

function UmbrielService.scroll_right()
    Noctalia.process.execute({
        command = "umbriel",
        args = { "msg", "window-focus-right" }
    })
end

Noctalia.export_service("umbriel_ribbon_service", UmbrielService)

return UmbrielService

