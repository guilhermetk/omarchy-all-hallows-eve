-- All Hallows Eve colorscheme for Neovim
-- Based on the original TextMate theme by David Heinemeier Hansson

local M = {}

-- Color palette extracted from TextMate theme
local colors = {
  -- Base colors
  bg = "#000000",           -- background
  fg = "#FFFFFF",           -- foreground
  caret = "#FFFFFF",        -- caret
  selection = "#73597EE0",  -- selection
  line_highlight = "#333300", -- lineHighlight
  invisibles = "#404040",   -- invisibles
  
  -- Text backgrounds
  text_bg = "#434242",      -- text background
  source_bg = "#000000",    -- source background
  
  -- Syntax colors
  comment = "#9933CC",      -- comment (purple)
  constant = "#3387CC",     -- constant (blue)
  keyword = "#CC7833",      -- keyword (orange)
  preprocessor = "#D0D0FF", -- preprocessor (light blue)
  string = "#66CC33",       -- string (green)
  string_escape = "#AAAAAA", -- string escapes (gray)
  string_interpolated_bg = "#CCCC33", -- string interpolated background
  string_interpolated_fg = "#000000", -- string interpolated foreground
  string_regexp = "#CCCC33", -- regular expression (yellow)
  string_literal = "#CCCC33", -- string literal (yellow)
  string_escape_interpolated = "#555555", -- string escapes in interpolated
  support_function = "#C83730", -- support function (red)
  block_comment_bg = "#9B9B9B", -- block comment background
  block_comment_fg = "#FFFFFF", -- block comment foreground
  
  -- Additional colors for better Neovim integration
  error = "#FF0000",
  warning = "#FFAA00",
  info = "#00AAFF",
  hint = "#AAAAAA",
  
  -- UI colors
  cursor_line = "#1A1A1A",
  visual = "#73597E",
  search = "#FFFF00",
  inc_search = "#FF8C00",
  
  -- Git colors
  git_add = "#66CC33",
  git_change = "#CCCC33",
  git_delete = "#CC3333",
  
  -- Diagnostic colors
  diagnostic_error = "#FF6B6B",
  diagnostic_warn = "#FFD93D",
  diagnostic_info = "#6BCF7F",
  diagnostic_hint = "#A8A8A8",
}

function M.setup()
  -- Clear existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.o.background = "dark"
  vim.g.colors_name = "all-hallows-eve"
  
  local highlight = function(group, opts)
    local cmd = "highlight " .. group
    if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
    if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
    if opts.style then cmd = cmd .. " gui=" .. opts.style end
    if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
    vim.cmd(cmd)
  end
  
  -- Editor highlights
  highlight("Normal", { fg = colors.fg, bg = colors.bg })
  highlight("Cursor", { fg = colors.bg, bg = colors.caret })
  highlight("CursorLine", { bg = colors.cursor_line })
  highlight("CursorColumn", { bg = colors.cursor_line })
  highlight("LineNr", { fg = colors.invisibles })
  highlight("CursorLineNr", { fg = colors.fg })
  highlight("Visual", { bg = colors.visual })
  highlight("VisualNOS", { bg = colors.visual })
  highlight("Search", { bg = colors.search, fg = colors.bg })
  highlight("IncSearch", { bg = colors.inc_search, fg = colors.bg })
  highlight("Folded", { fg = colors.comment, bg = colors.cursor_line })
  highlight("FoldColumn", { fg = colors.comment, bg = colors.bg })
  highlight("SignColumn", { bg = colors.bg })
  highlight("ColorColumn", { bg = colors.cursor_line })
  
  -- Syntax highlighting
  highlight("Comment", { fg = colors.comment, style = "italic" })
  highlight("Constant", { fg = colors.constant })
  highlight("String", { fg = colors.string })
  highlight("Character", { fg = colors.string })
  highlight("Number", { fg = colors.constant })
  highlight("Boolean", { fg = colors.constant })
  highlight("Float", { fg = colors.constant })
  
  highlight("Identifier", { fg = colors.fg })
  highlight("Function", { fg = colors.fg })
  
  highlight("Statement", { fg = colors.keyword })
  highlight("Conditional", { fg = colors.keyword })
  highlight("Repeat", { fg = colors.keyword })
  highlight("Label", { fg = colors.keyword })
  highlight("Operator", { fg = colors.keyword })
  highlight("Keyword", { fg = colors.keyword })
  highlight("Exception", { fg = colors.keyword })
  
  highlight("PreProc", { fg = colors.preprocessor })
  highlight("Include", { fg = colors.preprocessor })
  highlight("Define", { fg = colors.preprocessor })
  highlight("Macro", { fg = colors.preprocessor })
  highlight("PreCondit", { fg = colors.preprocessor })
  
  highlight("Type", { fg = colors.fg, style = "underline" })
  highlight("StorageClass", { fg = colors.keyword })
  highlight("Structure", { fg = colors.keyword })
  highlight("Typedef", { fg = colors.keyword })
  
  highlight("Special", { fg = colors.support_function })
  highlight("SpecialChar", { fg = colors.string_escape })
  highlight("Tag", { fg = colors.fg, style = "underline" })
  highlight("Delimiter", { fg = colors.fg })
  highlight("SpecialComment", { fg = colors.comment, bg = colors.block_comment_bg })
  highlight("Debug", { fg = colors.support_function })
  
  -- Error and diagnostics
  highlight("Error", { fg = colors.error })
  highlight("ErrorMsg", { fg = colors.error })
  highlight("WarningMsg", { fg = colors.warning })
  highlight("MoreMsg", { fg = colors.info })
  highlight("Question", { fg = colors.info })
  
  -- UI elements
  highlight("StatusLine", { fg = colors.fg, bg = colors.cursor_line })
  highlight("StatusLineNC", { fg = colors.invisibles, bg = colors.cursor_line })
  highlight("TabLine", { fg = colors.invisibles, bg = colors.cursor_line })
  highlight("TabLineFill", { bg = colors.cursor_line })
  highlight("TabLineSel", { fg = colors.fg, bg = colors.bg })
  highlight("WildMenu", { fg = colors.bg, bg = colors.string })
  highlight("Pmenu", { fg = colors.fg, bg = colors.cursor_line })
  highlight("PmenuSel", { fg = colors.bg, bg = colors.string })
  highlight("PmenuSbar", { bg = colors.invisibles })
  highlight("PmenuThumb", { bg = colors.fg })
  
  -- Diff colors
  highlight("DiffAdd", { fg = colors.git_add })
  highlight("DiffChange", { fg = colors.git_change })
  highlight("DiffDelete", { fg = colors.git_delete })
  highlight("DiffText", { fg = colors.git_change, style = "bold" })
  
  -- Git signs
  highlight("GitSignsAdd", { fg = colors.git_add })
  highlight("GitSignsChange", { fg = colors.git_change })
  highlight("GitSignsDelete", { fg = colors.git_delete })
  
  -- LSP diagnostics
  highlight("DiagnosticError", { fg = colors.diagnostic_error })
  highlight("DiagnosticWarn", { fg = colors.diagnostic_warn })
  highlight("DiagnosticInfo", { fg = colors.diagnostic_info })
  highlight("DiagnosticHint", { fg = colors.diagnostic_hint })
  
  -- LSP references
  highlight("LspReferenceText", { bg = colors.cursor_line })
  highlight("LspReferenceRead", { bg = colors.cursor_line })
  highlight("LspReferenceWrite", { bg = colors.cursor_line })
  
  -- Treesitter highlights (if available)
  highlight("@comment", { fg = colors.comment, style = "italic" })
  highlight("@constant", { fg = colors.constant })
  highlight("@string", { fg = colors.string })
  highlight("@string.escape", { fg = colors.string_escape })
  highlight("@string.regex", { fg = colors.string_regexp })
  highlight("@keyword", { fg = colors.keyword })
  highlight("@function", { fg = colors.fg })
  highlight("@function.builtin", { fg = colors.support_function })
  highlight("@variable.parameter", { fg = colors.fg, style = "italic" })
  highlight("@type", { fg = colors.fg, style = "underline" })
  highlight("@type.builtin", { fg = colors.keyword })
  highlight("@tag", { fg = colors.fg, style = "underline" })
  highlight("@tag.attribute", { fg = colors.fg })
  highlight("@preproc", { fg = colors.preprocessor })
  
  -- HTML/XML specific
  highlight("htmlTag", { fg = colors.fg, style = "underline" })
  highlight("htmlTagName", { fg = colors.fg, style = "underline" })
  highlight("htmlArg", { fg = colors.fg })
  highlight("htmlString", { fg = colors.string })
  
  -- CSS specific
  highlight("cssClassName", { fg = colors.fg, style = "underline" })
  highlight("cssIdentifier", { fg = colors.fg, style = "underline" })
  highlight("cssProperty", { fg = colors.fg })
  highlight("cssValueLength", { fg = colors.constant })
  highlight("cssValueNumber", { fg = colors.constant })
  highlight("cssColor", { fg = colors.constant })
  
  -- JavaScript specific
  highlight("javaScriptFunction", { fg = colors.keyword })
  highlight("javaScriptIdentifier", { fg = colors.keyword })
  highlight("javaScriptMember", { fg = colors.fg })
  
  -- Python specific
  highlight("pythonFunction", { fg = colors.fg })
  highlight("pythonBuiltin", { fg = colors.support_function })
  highlight("pythonDecorator", { fg = colors.preprocessor })
  
end

return M