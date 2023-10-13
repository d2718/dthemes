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

local void   = { common.color("#222222") }
local dimgrey = { common.color("#333333") }
local medgrey = { common.color("#4e4e4e") }
local ltgrey  = { common.color("#626262") }
local brgrey = { common.color("#959595") }
local bright = { common.color("#cccccc") }
local blast  = { common.color("#eeeeee") }
local haze   = { common.color("#cce1f1") }
local sand   = { common.color("#e1e0c8") }
local mint   = { common.color("#cfe8b7") }
local coral  = { common.color("#f7a597") }
local calamine = { common.color("#e3a6dc") }
local carolina = { common.color("#75caf2") }

style.background  = void  -- Docview
style.background2 = dimgrey -- Treeview
style.background3 = dimgrey -- Command view
style.text   = bright
style.caret  = bright
style.accent = blast
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = ltgrey
style.divider = dimgrey -- Line between nodes
style.selection       = medgrey
style.line_number     = ltgrey
style.line_number2    = blast -- With cursor
style.line_highlight  = dimgrey
style.scrollbar       = medgrey
style.scrollbar2      = ltgrey -- Hovered
style.scrollbar_track = dimgrey
style.nagbar      = sand
style.nagbar_text = medgrey
style.nagbar_dim  = { common.color "rgba(0, 0, 0, 0.45)" }
style.drag_overlay = { common.color "rgba(255,255,255,0.1)" }
style.drag_overlay_tab = { common.color "#93DDFA" }
style.good = mint
style.warn = sand
style.error = coral
style.modified = carolina

style.syntax["normal"]   = bright
style.syntax["symbol"]   = bright
style.syntax["comment"]  = brgrey
style.syntax["keyword"]  = haze-- local function end if case
style.syntax["keyword2"] = sand -- self int float
style.syntax["number"]   = calamine
style.syntax["literal"]  = sand  -- true false nil
style.syntax["string"]   = mint
style.syntax["operator"] = bright -- = + - / < >
style.syntax["function"] = carolina

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }

return style
