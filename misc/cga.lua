--[[
cga.lua

A tribute to IBM's Color Graphics Adapter's Palette 1
Lite XL version 1.0 2023-10-04

author/maintainer: Dan (github.com/d2718)
--]]

local style = require "core.style"
local common = require "core.common"

-- Reset all syntax fonts to the base font.
for k,v in pairs(style.syntax_fonts) do
  style.syntax_fonts[k] = style.code_font
end

-- Make a copy of the base `style.code_font` with the given option set.
-- Ex: get_styled_font("bold")
--   for a bold version of the base font.
local function get_styled_font(stylestr)
    local ok, options = pcall(
        function()
            local cfg = dofile(SETTINGS_FILE)
            return cfg.config.code_font.options
        end
    )

    if not ok then
        options = {
            ["antialiasing"] = "subpixel",
            ["hinting"] = "slight",
            ["bold"] = false,
            ["italic"] = false,
            ["underline"] = false,
            ["smoothing"] =  false,
            ["strikethrough"] = false,
        }
    end

    options.size = style.code_font:get_size()
    options[stylestr] = true
    
    return style.code_font:copy(options.size, options)
end

local bold_font = get_styled_font("bold")
local italic_font = get_styled_font("italic")

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
style.syntax_fonts["keyword"] = bold_font
style.syntax["keyword2"] = whiffmagenta -- self int float
style.syntax_fonts["keyword2"] = italic_font
style.syntax["number"]   = ltwhite
style.syntax["literal"]  = ltwhite  -- true false nil
style.syntax_fonts["literal"] = bold_font

style.syntax["string"]   = brpmagenta
style.syntax["operator"] = hintmagenta -- = + - / < >
style.syntax["function"] = cyan

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style


