local M = {}

local palette = {
    bg = "#181818",
    fg = "#d6d6dd",
    gray = "#6d6d6d",
    blue = "#228df2",
    light_blue = "#87c3ff",
    cyan = "#82d2ce",
    green = "#15ac91",
    light_green = "#a8cc7c",
    yellow = "#f8c762",
    orange = "#efb080",
    red = "#f14c4c",
    magenta = "#e567dc",
    purple = "#aaa0fa",
    dark_purple = "#5b51ec",
    ui_blue = "#163761",
}

function M.setup()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "vscode_theme"

    local groups = {
        -- Vim interface
        Normal = { fg = palette.fg, bg = palette.bg },
        NormalFloat = { fg = palette.fg, bg = palette.bg },
        Cursor = { fg = palette.bg, bg = palette.fg },
        CursorLine = { bg = "#292929" },
        CursorColumn = { bg = "#292929" },
        ColorColumn = { bg = "#292929" },
        LineNr = { fg = "#6b6b6b" },
        CursorLineNr = { fg = palette.fg },
        VertSplit = { fg = "#383838" },
        Folded = { fg = palette.gray, bg = "#292929" },
        FoldColumn = { fg = "#6b6b6b", bg = palette.bg },
        SignColumn = { bg = palette.bg },
        StatusLine = { fg = palette.fg, bg = "#292929" },
        StatusLineNC = { fg = "#6b6b6b", bg = "#292929" },
        Pmenu = { fg = palette.fg, bg = "#292929" },
        PmenuSel = { fg = palette.fg, bg = palette.ui_blue },
        PmenuSbar = { bg = "#292929" },
        PmenuThumb = { bg = "#6b6b6b" },
        MatchParen = { fg = palette.yellow, bold = true },
        NonText = { fg = "#3c3c3c" },
        SpecialKey = { fg = "#3c3c3c" },
        Visual = { bg = "#163761" },
        VisualNOS = { bg = "#163761" },
        Search = { fg = palette.bg, bg = "#7c511a" },
        IncSearch = { fg = palette.bg, bg = "#7c511a" },
        QuickFixLine = { bg = "#163761" },
        Terminal = { fg = palette.fg, bg = "#191919" },

        -- Syntax
        Comment = { fg = palette.gray, italic = true },
        Constant = { fg = palette.orange },
        String = { fg = palette.magenta },
        Character = { fg = palette.magenta },
        Number = { fg = "#ebc88d" },
        Boolean = { fg = palette.cyan },
        Float = { fg = "#ebc88d" },
        Identifier = { fg = palette.light_blue },
        Function = { fg = "#ebc88d" },
        Statement = { fg = palette.cyan },
        Conditional = { fg = palette.cyan },
        Repeat = { fg = palette.cyan },
        Label = { fg = palette.cyan },
        Operator = { fg = palette.fg },
        Keyword = { fg = palette.cyan },
        Exception = { fg = palette.cyan },
        PreProc = { fg = palette.cyan },
        Include = { fg = palette.cyan },
        Define = { fg = palette.cyan },
        Macro = { fg = palette.cyan },
        PreCondit = { fg = palette.cyan },
        Type = { fg = palette.orange },
        StorageClass = { fg = palette.cyan },
        Structure = { fg = palette.cyan },
        Typedef = { fg = palette.cyan },
        Special = { fg = palette.yellow },
        SpecialChar = { fg = palette.yellow },
        Tag = { fg = "#fad075" },
        Delimiter = { fg = palette.fg },
        SpecialComment = { fg = palette.gray },
        Debug = { fg = palette.orange },
        Underlined = { underline = true },
        Ignore = { fg = palette.gray },
        Error = { fg = palette.red },
        Todo = { fg = palette.magenta, bold = true },

        -- Treesitter
        ["@punctuation.delimiter"] = { fg = palette.fg },
        ["@punctuation.bracket"] = { fg = palette.fg },
        ["@punctuation.special"] = { fg = palette.cyan },
        ["@constant"] = { fg = palette.orange },
        ["@constant.builtin"] = { fg = palette.orange },
        ["@constant.macro"] = { fg = palette.orange },
        ["@string.regex"] = { fg = palette.red },
        ["@string"] = { fg = palette.magenta },
        ["@character"] = { fg = palette.magenta },
        ["@number"] = { fg = "#ebc88d" },
        ["@boolean"] = { fg = palette.cyan },
        ["@float"] = { fg = "#ebc88d" },
        ["@annotation"] = { fg = palette.yellow },
        ["@attribute"] = { fg = palette.cyan },
        ["@namespace"] = { fg = palette.orange },
        ["@function.builtin"] = { fg = palette.cyan },
        ["@function"] = { fg = "#ebc88d" },
        ["@function.macro"] = { fg = "#ebc88d" },
        ["@parameter"] = { fg = palette.fg },
        ["@parameter.reference"] = { fg = palette.fg },
        ["@method"] = { fg = "#ebc88d" },
        ["@field"] = { fg = palette.purple },
        ["@property"] = { fg = palette.purple },
        ["@constructor"] = { fg = palette.cyan },
        ["@conditional"] = { fg = palette.cyan },
        ["@repeat"] = { fg = palette.cyan },
        ["@label"] = { fg = palette.cyan },
        ["@keyword"] = { fg = palette.cyan },
        ["@keyword.function"] = { fg = palette.cyan },
        ["@keyword.operator"] = { fg = palette.cyan },
        ["@operator"] = { fg = palette.fg },
        ["@exception"] = { fg = palette.cyan },
        ["@type"] = { fg = palette.orange },
        ["@type.builtin"] = { fg = palette.orange },
        ["@structure"] = { fg = palette.orange },
        ["@include"] = { fg = palette.cyan },
        ["@variable"] = { fg = palette.light_blue },
        ["@variable.builtin"] = { fg = palette.orange },

        -- LSP
        DiagnosticError = { fg = palette.red },
        DiagnosticWarn = { fg = palette.yellow },
        DiagnosticInfo = { fg = palette.blue },
        DiagnosticHint = { fg = palette.cyan },
        LspReferenceText = { bg = "#2c2c2c" },
        LspReferenceRead = { bg = "#2c2c2c" },
        LspReferenceWrite = { bg = "#2c2c2c" },

        -- Plugins
        TelescopeNormal = { fg = palette.fg, bg = palette.bg },
        TelescopeBorder = { fg = "#383838", bg = palette.bg },
        TelescopePromptNormal = { fg = palette.fg, bg = "#292929" },
        TelescopePromptBorder = { fg = "#383838", bg = "#292929" },
        TelescopePromptTitle = { fg = palette.fg, bg = palette.ui_blue },
        TelescopePreviewTitle = { fg = palette.fg, bg = palette.ui_blue },
        TelescopeResultsTitle = { fg = palette.fg, bg = palette.ui_blue },  -- update color here if needed

        GitSignsAdd = { fg = palette.green },
        GitSignsChange = { fg = palette.blue },
        GitSignsDelete = { fg = palette.red },

        BufferLineFill = { bg = "#292929" },
        BufferLineBackground = { fg = "#6b6b6b", bg = "#292929" },
        BufferLineBufferVisible = { fg = palette.fg, bg = "#292929" },
        BufferLineBufferSelected = { fg = palette.fg, bg = palette.bg, bold = true },

        IndentBlanklineChar = { fg = "#3c3c3c" },
        IndentBlanklineContextChar = { fg = palette.purple },
    }

    for group, styles in pairs(groups) do
        vim.api.nvim_set_hl(0, group, styles)
    end
end

return M
