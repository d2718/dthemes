--[[
sunset.lua

A theme in blues and oranges.
Lite-XL version 1.0 2023-10-19

author/maintainer: Dan (github.com/d2718)
--]]

local style = require "core.style"
local common = require "core.common"

-- Reset all syntax fonts to the base font.
--
-- NOTE: This is not generally found in Lite-XL themes, but if any of
-- your themes change font style (like this one does), your themes
-- should all start with this, or else that font style change will
-- persist between theme changes.
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

local night    = { common.color("#08040c") }
local twilight = { common.color("#101828") }
local cloud    = { common.color("#302c34") }
local fog      = { common.color("#404858") }
local melville = { common.color("#5080a8") }
local sky      = { common.color("#58b0e0") }

local mountain = { common.color("#807890") }

local coals    = { common.color("#e0500c") }
local fire     = { common.color("#f08020") }
local pomelo   = { common.color("#f0a050") }
local sun      = { common.color("#f6d3a0") }
local lining   = { common.color("#e8e0c8") }

style.background  = night  -- Docview
style.background2 = twilight -- Treeview
style.background3 = twilight -- Command view
style.text   = sun
style.caret  = fire
style.accent = sky
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim     = fire
style.divider = cloud -- Line between nodes
style.selection      = cloud
style.line_number    = fog
style.line_number2   = sun -- With cursor
style.line_highlight = cloud -- twilight
style.scrollbar       = fog
style.scrollbar2      = sun -- Hovered
style.scrollbar_track = twilight
style.nagbar      = fire
style.nagbar_text = cloud
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay     = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = melville
style.warn     = sun
style.error    = coals
style.modified = lining

style.syntax["normal"]   = sun
style.syntax["symbol"]   = sun
style.syntax["comment"]  = melville
style.syntax["keyword"]  = fire  -- local function end if case
style.syntax["keyword2"] = lining -- self int float
style.syntax_fonts["keyword2"] = italic_font
style.syntax["number"]   = sky
style.syntax["literal"]  = sky  -- true false nil
style.syntax_fonts["literal"]  = bold_font
style.syntax["string"]   = mountain
style.syntax["operator"] = fire -- = + - / < >
style.syntax["function"] = pomelo

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
