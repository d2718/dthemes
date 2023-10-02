--[[
Basalt theme (https://github.com/RustingRobot/basalt-theme)
    A simple theme with a pink and blue color focus.
for Lite-XL (https://lite-xl.com)
--]]

local style = require "core.style"
local common = require "core.common"

local wet       = { common.color "#1e222b" }
local basalt    = { common.color "#282c34" }
local dry       = { common.color "#2b303a" }
local granite   = { common.color "#383f4e" }
local slate     = { common.color "#3c5870" }
local shale     = { common.color "#5b5964" }
local graven    = { common.color "#616e88" }
local talus     = { common.color "#6d6875" }
local chalk     = { common.color "#a3a3a3" }
local smoke     = { common.color "#91aabc" }
local mist      = { common.color "#96a1b7" }
local limestone = { common.color "#d8dee9" }

local kyanite = { common.color "#6592d6" }
local sky     = { common.color "#80b3d8" }

local garnet   = { common.color "#73464e" }
local rhodo    = { common.color "#bf616a" }
local calamine = { common.color "#e4b3b5" }
local coral    = { common.color "#f3d5d9" }
local jasper   = { common.color "#ff293b" }

style.background  = basalt  -- Docview
style.background2 = wet                    -- Treeview
style.background3 = wet                    -- Command view
style.text   = mist
style.caret  = rhodo
style.accent = limestone
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim       = chalk
style.divider   = granite -- Line between nodes
style.selection = slate
style.line_number    = shale
style.line_number2   = chalk -- With cursor
style.line_highlight = dry
style.scrollbar       = wet
style.scrollbar2      = dry -- Hovered
style.scrollbar_track = basalt
style.nagbar      = rhodo
style.nagbar_text = basalt
style.nagbar_dim  = garnet
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = kyanite
style.warn     = rhodo
style.error    = jasper
style.modified = limestone

style.lint = {}
style.lint.hint = chalk
style.lint.info = kyanite
style.lint.warning = rhodo
style.lint.error = jasper

style.syntax["normal"]   = limestone
style.syntax["symbol"]   = limestone
style.syntax["comment"]  = graven
style.syntax["keyword"]  = talus  -- local function end if case
style.syntax["keyword2"] = coral  -- self int float
style.syntax["number"]   = mist
style.syntax["literal"]  = mist  -- true false nil
style.syntax["string"]   = smoke
style.syntax["operator"] = mist  -- = + - / < >
style.syntax["function"] = sky

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
