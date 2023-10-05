--[[
cga.lua

A tribute to IBM's Color Graphics Adapter's Palette 1
Lite XL version 1.0 2023-10-04

author/maintainer: Dan (github.com/d2718)
--]]

local style = require "core.style"
local common = require "core.common"

local black = { common.color("#000000") }
local dkgrey = { common.color("#222222") }
local mdgrey = { common.color("#444444") }
local ltgrey = { common.color("#666666") }
local dkwhite = { common.color("#888888") }
local white   = { common.color("#aaaaaa") }
local ltwhite = { common.color("#cccccc") }
local brwhite = { common.color("#eeeeee") }

local faintcyan = { common.color("#183333") }
local weakcyan  = { common.color("#448888") }
local cyan      = { common.color("#00aaaa") }
local pcyan     = { common.color("#55aaaa") }
local brpcyan   = { common.color("#66cccc") }
local whiffcyan = { common.color("#aacccc") }

local dimmagenta  = { common.color("#440044") }
local weakmagenta = { common.color("#884488") }
local magenta     = { common.color("#aa00aa") }
local hintmagenta = { common.color("#aa88aa") }
local brpmagenta  = { common.color("#cc66cc") }
local whiffmagenta = { common.color("#ccaacc") }

style.background  = black  -- Docview
style.background2 = dkgrey -- Treeview
style.background3 = dkgrey -- Command view
style.text   = white
style.caret  = ltwhite
style.accent = brpcyan
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = ltgrey
style.divider = { common.color "#202024" } -- Line between nodes
style.selection = dimmagenta
style.line_number    = ltgrey
style.line_number2   = white -- With cursor
style.line_highlight = dkgrey
style.scrollbar = white
style.scrollbar2 = pcyan  -- Hovered
style.scrollbar_track = mdgrey
style.nagbar = magenta
style.nagbar_text = faintcyan
style.nagbar_dim = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good  = white
style.warn  = cyan
style.error = magenta
style.modified = ltgrey

style.syntax["normal"]   = white
style.syntax["symbol"]   = white
style.syntax["comment"]  = ltgrey
style.syntax["keyword"]  = whiffcyan  -- local function end if case
style.syntax["keyword2"] = whiffmagenta -- self int float
style.syntax["number"]   = ltwhite
style.syntax["literal"]  = ltwhite  -- true false nil
style.syntax["string"]   = brpmagenta
style.syntax["operator"] = hintmagenta -- = + - / < >
style.syntax["function"] = cyan

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
