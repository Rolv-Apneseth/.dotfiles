local require_plugin = require("core.helpers").require_plugin

local colorizer = require_plugin("colorizer")
if not colorizer then
    return
end

colorizer.setup({
    filetypes = { "*" },
    user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        --[[ mode="virtualtext", ]]
        --[[ virtualtext = "■", ]]
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {
        "*",
        -- exclude prompt and popup buftypes from highlight
        "!prompt",
        "!popup",
    },
})

-- Test
-- #333 #fff #ff00ff hsl(200, 40%, 30%) rgb(200, 100, 100) blue yellow #ffffff99
