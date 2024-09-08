local vim = vim -- to avoid undefined vim warning all down the file

vim.o.background='light'
vim.cmd([[
  hi clear
  let g:colors_name = 'halftone'
  highlight StatusLine cterm=bold ctermbg=NONE ctermfg=16 gui=bold guibg=NONE guifg=#000000
  highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=16 gui=NONE guibg=NONE guifg=#000000

  highlight SignColumn ctermbg=NONE guibg=NONE
  highlight CursorLine cterm=bold guibg=#F1F1F0
  highlight Visual ctermbg=153 guibg=#D1D1D1 gui=bold

  " Tilde characters that identify non-existent lines
  highlight NonText ctermfg=gray guifg=#D1D1D1

  highlight LineNr ctermfg=gray guifg=#5E5E5E
  highlight CursorLineNr cterm=bold gui=bold guifg=#000000

  highlight WinBar gui=bold guifg=#000000 guibg=#ffffff
  highlight WinBarNC guifg=#000000 guibg=#ffffff

  highlight Directory gui=bold guifg=#000000

  highlight Title gui=bold guifg=#000000
  highlight SpecialKey gui=bold guifg=#000000

  " All pop-up windows
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
  highlight Pmenu ctermbg=NONE guibg=NONE guifg=#000000
  highlight PmenuSel ctermbg=gray guibg=#F1F1F0 guifg=#000000
  highlight Float ctermbg=NONE guibg=NONE guifg=#000000
  highlight NormalFloat ctermbg=NONE guibg=NONE

  highlight CmpItemAbbrMatch gui=bold

  highlight VertSplit ctermfg=black ctermbg=NONE guifg=#cccccc guibg=NONE
  highlight WinSeparator ctermfg=black ctermbg=NONE guifg=#cccccc guibg=NONE

  highlight Constant ctermfg=black guifg=#000000
  highlight Error ctermfg=black guibg=#FFEDEB guifg=#000000
  highlight ErrorMsg ctermfg=black guibg=#FFEDEB guifg=#000000
  highlight WarningMsg ctermfg=black guibg=#FFFBEB guifg=#000000
  highlight Statement ctermfg=black guifg=#000000
  highlight Identifier ctermfg=black guifg=#000000
  highlight Special ctermfg=black guifg=#000000

  highlight Type ctermfg=black guifg=#373737 gui=underline
  highlight Function cterm=bold ctermfg=black gui=bold guifg=#000000
  highlight Comment ctermfg=darkgray guifg=#5E5E5E

  highlight @keyword cterm=bold ctermfg=black gui=bold guifg=#000000

  highlight @tag cterm=bold ctermfg=blue gui=bold
  highlight @tag.delimiter cterm=NONE ctermfg=blue gui=NONE
  highlight @tag.attribute cterm=NONE ctermfg=yellow gui=NONE

  highlight Search ctermbg=white ctermfg=black guibg=#FF8200 guifg=#000000
  highlight CurSearch ctermbg=white ctermfg=black guibg=#D1D1D1 guifg=#000000
  highlight IncSearch ctermbg=white ctermfg=black guibg=#D1D1D1 guifg=#000000
  highlight MatchParen ctermbg=blue ctermfg=black gui=bold guibg=#007AFF guifg=#FFFFFF
  highlight @punctuation.bracket ctermfg=black
  highlight cssBraces cterm=NONE ctermfg=black

  highlight @type.css cterm=bold ctermfg=blue
  highlight @constant.css cterm=bold ctermfg=blue

  highlight @markup.heading cterm=bold gui=bold
  highlight @markup.list cterm=bold gui=bold
  highlight @markup.italic cterm=italic gui=italic
  highlight @markup.strong cterm=bold gui=bold
  highlight @markup.link.label ctermfg=yellow
  highlight @markup.link.url cterm=underline ctermfg=blue gui=underline

  highlight diffRemoved ctermbg=red
  highlight diffAdded ctermbg=yellow

  highlight DiagnosticUnderlineError cterm=NONE ctermbg=red gui=NONE guibg=#FFEDEB

  highlight LeapLabelPrimary gui=bold,nocombine guibg=#FF8200 guifg=#000000
  highlight LeapLabelSecondary gui=bold,nocombine guibg=#007AFF guifg=#000000

  highlight DiffAdd guibg=NONE guifg=#B3F261
  highlight DiffChange guibg=NONE guifg=#FFD966
  highlight DiffDelete guibg=NONE guifg=#FF6666

  highlight DiagnosticError guibg=NONE guifg=#FF6666
  highlight DiagnosticWarn guibg=NONE guifg=#FFD966
  highlight DiagnosticInfo guibg=NONE guifg=#007AFF
  highlight DiagnosticOk guibg=NONE guifg=#B3F261
  highlight DiagnosticHint guibg=NONE guifg=#5E5E5E

  highlight DevIconDefault ctermfg=black guifg=#000000
]])
