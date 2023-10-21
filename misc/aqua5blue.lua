--[[
aqua5blue

A dark theme in blues and greens, Lite XL version.

by Dan (github.com/d2718)
]]

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

local dkgrey    = { common.color("#303030") }
local ltgrey    = { common.color("#a0a0a0") }

local deepgreen = { common.color("#081810") }
local dimgreen  = { common.color("#103020") }
local medgreen  = { common.color("#309060") }
local green     = { common.color("#40c090") }
local brgreen   = { common.color("#50f0a0") }

local deepblue  = { common.color("#081018") }
local dimblue   = { common.color("#102030") }
local medblue   = { common.color("#306090") }
local blue      = { common.color("#4090c0") }
local brblue    = { common.color("#50a0f0") }

local yellow    = { common.color("#90c040") }
local orange    = { common.color("#c09040") }

style.background  = deepgreen  -- Docview
style.background2 = deepblue -- Treeview
style.background3 = deepblue-- Command view
style.text   = green
style.caret  = blue
style.accent = brblue
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = medgreen
style.divider = dkgrey -- Line between nodes
style.selection      = dimblue
style.line_number    = medgreen
style.line_number2   = blue -- With cursor
style.line_highlight = dimgreen
style.scrollbar       = dimblue
style.scrollbar2      = blue -- Hovered
style.scrollbar_track = deepblue
style.nagbar = { common.color "#FF0000" }
style.nagbar_text = { common.color "#FFFFFF" }
style.nagbar_dim = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good     = green
style.warn     = blue
style.error    = orange
style.modified = ltgrey

style.syntax["normal"] = green
style.syntax["symbol"] = green
style.syntax["comment"] = medblue
style.syntax["keyword"] = brblue  -- local function end if case
style.syntax["keyword2"] = blue-- self int float
style.syntax_fonts["keyword2"] = bold_font
style.syntax["number"] = brgreen
style.syntax["literal"] = brgreen  -- true false nil
style.syntax["string"] = yellow
style.syntax["operator"] = ltgrey -- = + - / < >
style.syntax["function"] = green

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
