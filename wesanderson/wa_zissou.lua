

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

local deeps = { common.color("#03090b") }
local depth = { common.color("#091b21") }
local ocean = { common.color("#2f7b8e") }
local water = { common.color("#3b9ab2") } --

local night   = { common.color("#162124") }
local gloom   = { common.color("#2d4248") }
local air     = { common.color("#78b7c5") } --
local haze    = { common.color("#b7d8e0") }

local sunken  = { common.color("#88a35e") }
local risen   = { common.color("#bfcd9a") }
local yellow  = { common.color("#ebcc2a") } --
local gold    = { common.color("#e1af00") } --
local magma   = { common.color("#ee6d13") }
local crimson = { common.color("#f21a00") }--

style.background  = deeps  -- Docview
style.background2 = night -- Treeview
style.background3 = night -- Command view
style.text   = air
style.caret  = air
style.accent = haze
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = sunken
style.divider = gloom -- Line between nodes
style.selection       = gloom
style.line_number     = ocean
style.line_number2    = air -- With cursor
style.line_highlight  = depth
style.scrollbar       = ocean
style.scrollbar2      = water -- Hovered
style.scrollbar_track = depth
style.nagbar      = magma
style.nagbar_text = gloom
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good = air
style.warn = gold
style.error = crimson
style.modified = water

style.syntax["normal"]   = air
style.syntax["symbol"]   = air
style.syntax["comment"]  = ocean
style.syntax["keyword"]  = yellow -- local function end if case
style.syntax["keyword2"] = water -- self int float
style.syntax_fonts["keyword2"] = italic_font
style.syntax["number"]   = yellow
style.syntax["literal"]  = haze
style.syntax_fonts["literal"] = bold_font  -- true false nil
style.syntax["string"]   = gold
style.syntax["operator"] = risen -- = + - / < >
style.syntax["function"] = air

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
