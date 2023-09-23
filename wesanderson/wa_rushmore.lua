local style = require "core.style"
local common = require "core.common"

local mustard = { common.color "#e1bd6d" }
local khaki = { common.color "#eabe94" }
local spruce = { common.color "#0b775e" }
local navy = { common.color "#2B203C" }
local red = { common.color "#f23000f" }

local white = { common.color "#f8eadd" }
local black = { common.color "#161425" }
local tan = { common.color "#C8A17E" }
local moss = { common.color "#074537" }

style.background  = navy -- Docview
style.background2 = navy -- Treeview
style.background3 = navy -- Command view
style.text   = khaki
style.caret  = khaki
style.accent = white
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim       = tan
style.divider   = black -- Line between nodes
style.selection = mustard
style.line_number    = { common.color "#525259" }
style.line_number2   = white -- With cursor
style.line_highlight = moss
style.scrollbar       = spruce
style.scrollbar2      = mustard -- Hovered
style.scrollbar_track = navy
style.nagbar      = red
style.nagbar_text = navy
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = white
style.warn     = { common.color "#FFA94D" }
style.error    = red
style.modified = { common.color "#1c7c9c" }

style.syntax["normal"]   = khaki
style.syntax["symbol"]   = mustard
style.syntax["comment"]  = tan
style.syntax["keyword"]  = white  -- local function end if case
style.syntax["keyword2"] = white -- self int float
style.syntax["number"]   = khaki
style.syntax["literal"]  = white  -- true false nil
style.syntax["string"]   = spruce
style.syntax["operator"] = white -- = + - / < >
style.syntax["function"] = mustard

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
