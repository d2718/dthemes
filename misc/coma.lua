--[[
coma.lua

A muted theme inspired by the aesthetics of
[sema](https://github.com/lunacookies/sema).

Lite XL version 1.0, 2023-10-24

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

local black   = { common.color("#12100c") }
local ltblack = { common.color("#202020")}
local dkgrey  = { common.color("#404044")}
local mutegrey = { common.color("#707080")}
local grey    = { common.color("#a0a0b0")}
local brgrey   = { common.color("#c0c0d0") }

local red     = { common.color("#a08080")}
local yellow  = { common.color("#a0a080")}
local green =   { common.color("#80a080")}
local cyan    = { common.color("#80a0a0")}
local blue    = { common.color("#8080a0")}
local magenta = { common.color("#a080a0")}

style.background  = black  -- Docview
style.background2 = ltblack -- Treeview
style.background3 = ltblack -- Command view
style.text   = grey
style.caret  = grey
style.accent = brgrey
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = mutegrey
style.divider = ltblack -- Line between nodes
style.selection       = dkgrey
style.line_number     = mutegrey
style.line_number2    = grey -- With cursor
style.line_highlight  = ltblack
style.scrollbar       = dkgrey
style.scrollbar2      = mutegrey -- Hovered
style.scrollbar_track = ltblack
style.nagbar      = magenta
style.nagbar_text = dkgrey
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good = green
style.warn = yellow
style.error = red
style.modified = cyan

style.syntax["normal"]   = grey
style.syntax["symbol"]   = grey
style.syntax["comment"]  = mutegrey
style.syntax["keyword"]  = blue-- local function end if case
style.syntax["keyword2"] = blue -- self int float
style.syntax_fonts["keyword2"] = bold_font
style.syntax["number"]   = brgrey
style.syntax["literal"]  = brgrey  -- true false nil
style.syntax_fonts["literal"] = italic_font
style.syntax["string"]   = green
style.syntax["operator"] = yellow -- = + - / < >
style.syntax["function"] = cyan

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
