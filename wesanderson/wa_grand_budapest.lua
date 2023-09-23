local style = require "core.style"
local common = require "core.common"

local mustard  = { common.color "#f1bb7b" }
local coral    = { common.color "#fd6467" }
local burgundy = { common.color "#5b1a18" }
local sambucca = { common.color "#300F0D" }
local grey     = { common.color "#1e1e1e" }
local clay     = { common.color "#d67236" }

local yogurt = { common.color "#e6a0c4" }
local lilac  = { common.color "#c6cdf7" }
local dust   = { common.color "#d8a499" }
local white  = { common.color "#F4E5E2" }
local perrywinkle = { common.color "#7294d4" }

style.background  = sambucca -- Docview
style.background2 = sambucca -- Treeview
style.background3 = sambucca -- Command view
style.text   = white
style.caret  = dust
style.accent = lilac
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim       = dust
style.divider   = burgundy -- Line between nodes
style.selection = burgundy
style.line_number    = dust
style.line_number2   = lilac -- With cursor
style.line_highlight = grey
style.scrollbar       = dust
style.scrollbar2      = clay -- Hovered
style.scrollbar_track = burgundy
style.nagbar      = coral
style.nagbar_text = sambucca
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = white
style.warn     = yogurt
style.error    = coral
style.modified = { common.color "#1c7c9c" }

style.syntax["normal"]   = white
style.syntax["symbol"]   = white
style.syntax["comment"]  = dust
style.syntax["keyword"]  = yogurt  -- local function end if case
style.syntax["keyword2"] = yogurt -- self int float
style.syntax["number"]   = mustard 
style.syntax["literal"]  =  mustard  -- true false nil
style.syntax["string"]   =  perrywinkle
style.syntax["operator"] = clay -- = + - / < >
style.syntax["function"] = lilac

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
