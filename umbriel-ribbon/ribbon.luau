--!nonstrict

-- Configure static bar icon and tooltip on load
barWidget.setGlyph("columns-2")
barWidget.setTooltip("Scroll up/down to navigate Umbriel columns left/right")

-- Handle mouse-wheel / trackpad scroll events over the widget
-- steps: negative = scroll up / left, positive = scroll down / right
function onScroll(axis, steps, startsGesture)
    if steps == 0 then
        return
    end

    -- Use "window-focus-left" / "window-focus-right" to step focus across columns,
    -- or swap to "layout-scroll-left" / "layout-scroll-right" to pan without changing focus.
    local actionName = if steps < 0 then "window-focus-left" else "window-focus-right"

    -- Fire once per wheel detent
    local count = math.abs(steps)
    for _ = 1, count do
        noctalia.umbriel.action({ action = actionName })
    end
end
