--!nonstrict
local Widget = require("@noctalia/ui/widget")
local Icon = require("@noctalia/ui/icon")
local Noctalia = require("@noctalia/core")

local ribbonService = Noctalia.import_service("umbriel_ribbon_service")

local RibbonWidgetEntry = {}

function RibbonWidgetEntry.init(plugin)
    -- Build a safe, invisible collision bounding area on the bar
    local ribbonWidget = Widget.new({
        name = "umbriel-ribbon-anchor",
        tooltip = "Hover and scroll to shift layout columns",
    })

    -- Add the clean, static column icon to serve as your alignment cue
    local staticIcon = Icon.new({
        source = "view-column-symbolic",
        size = 16,
    })
    ribbonWidget:set_child(staticIcon)

    -- Map your pure wheel tracking logic
    ribbonWidget.on_scroll = function(direction)
        if direction == "up" then
            ribbonService.scroll_left()
        elseif direction == "down" then
            ribbonService.scroll_right()
        end
    end

    -- Register the module straight to the Noctalia widget shelf
    plugin:register_widget(ribbonWidget)
end

return RibbonWidgetEntry

