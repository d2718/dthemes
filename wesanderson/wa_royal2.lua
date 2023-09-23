local style = require "core.style"
local common = require "core.common"

local white     = { common.color "#f0f8f0" }
local bg_shadow = { common.color "#221B07" }
local latte     = { common.color "#4F4D48" }
local c_bronze  = { common.color "#9a8822" }
local kw_sage   = { common.color "#74a089" }
local dust      = { common.color "#f5cdb4" }
local manila    = { common.color "#fddda0" }
local coral     = { common.color "#f8afa8" }

style.background  = bg_shadow -- Docview
style.background2 = bg_shadow -- Treeview
style.background3 = bg_shadow -- Command view
style.text   = white
style.caret  = dust
style.accent = manila
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = dust
style.divider = { common.color "#202024" } -- Line between nodes
style.selection = latte
style.line_number    = latte
style.line_number2   = dust -- With cursor
style.line_highlight = latte
style.scrollbar       = latte
style.scrollbar2      = c_bronze -- Hovered
style.scrollbar_track = bg_shadow
style.nagbar      = coral
style.nagbar_text = bg_shadow
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = white
style.warn     = c_bronze
style.error    = { common.color "#FF7366" }
style.modified = dust

style.syntax["normal"]   = white
style.syntax["symbol"]   = white
style.syntax["comment"]  = c_bronze
style.syntax["keyword"]  = kw_sage -- local function end if case
style.syntax["keyword2"] = kw_sage -- self int float
style.syntax["number"]   = dust
style.syntax["literal"]  = dust -- true false nil
style.syntax["string"]   = coral
style.syntax["operator"] = dust -- = + - / < >
style.syntax["function"] = manila

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
