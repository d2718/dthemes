local style = require "core.style"
local common = require "core.common"

local grey  = { common.color "#899da4" }
local red   = { common.color "#c93312" }
local white = { common.color "#faefd1" }
local tan   = { common.color "#dc863b" }

local coal   = { common.color "#1A1D1F" }
local maroon = { common.color "#a9685b" }
local mauve  = { common.color "#3D2621" }
local orange = { common.color "#d25c26" }
local sauce  = { common.color "#ebba86" }

style.background  = coal  -- Docview
style.background2 = coal -- Treeview
style.background3 = coal  -- Command view
style.text   = white
style.caret  = sauce
style.accent = tan
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim       = sauce
style.divider   = mauve -- Line between nodes
style.selection = { common.color "#404048"}
style.line_number = grey
style.line_number2 = maroon -- With cursor
style.line_highlight = mauve
style.scrollbar       = mauve
style.scrollbar2      = red -- Hovered
style.scrollbar_track = coal
style.nagbar      = red
style.nagbar_text = white
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = white
style.warn     = tan
style.error    = red
style.modified = { common.color "#1c7c9c" }

style.syntax["normal"] = white
style.syntax["symbol"] = white
style.syntax["comment"] = grey
style.syntax["keyword"]  = red  -- local function end if case
style.syntax["keyword2"] = red -- self int float
style.syntax["number"]   = orange
style.syntax["literal"]  = orange -- true false nil
style.syntax["string"]   = tan
style.syntax["operator"] = sauce -- = + - / < >
style.syntax["function"] = maroon

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
