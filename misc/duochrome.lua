--[[
duochrome.lua

A theme tribute to the amber and green monochrome displays of yesteryear.
Lite XL version 1.0 2023-10-19

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
local grey  = { common.color("#809080") }

local dimgreen = { common.color("#002000") }
local dkgreen  = { common.color("#004000") }
local medgreen = { common.color("#008000") }
local subgreen = { common.color("#00a000") }
local green    = { common.color("#00c000") }
local maxgreen = { common.color("#00e000") }

local dimbrown = { common.color("#1c1402") }
local dkbrown  = { common.color("#392804") }
local gold     = { common.color("#735108") }
local orange   = { common.color("#906508") }
local amber    = { common.color("#d89810") }
local bramber  = { common.color("#eac860") }

style.background  = black  -- Docview
style.background2 = dimbrown  -- Treeview
style.background3 = dimbrown -- Command view
style.text   = green
style.caret  = amber
style.accent = bramber
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = gold
style.divider = dkbrown  -- Line between nodes
style.selection = dkgreen
style.line_number    = medgreen
style.line_number2   = amber -- With cursor
style.line_highlight = dimgreen
style.scrollbar       = medgreen
style.scrollbar2      = amber-- Hovered
style.scrollbar_track = dimgreen
style.nagbar      = gold
style.nagbar_text = dimgreen
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = subgreen
style.warn     = gold
style.error    = bramber
style.modified = grey

style.syntax["normal"] = green
style.syntax["symbol"] = green
style.syntax["comment"] = grey
style.syntax["keyword"] = orange  -- local function end if case
style.syntax["keyword2"] = amber -- self int float
style.syntax_fonts["keyword2"] = bold_font
style.syntax["number"] = maxgreen
style.syntax["literal"] = maxgreen  -- true false nil
style.syntax_fonts["literal"] = bold_font
style.syntax["string"] = subgreen
style.syntax_fonts["string"] = italic_font
style.syntax["operator"] = orange -- = + - / < >
style.syntax["function"] = green

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
