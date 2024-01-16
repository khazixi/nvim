vim.api.nvim_create_autocmd({'BufWritePost'}, {
  pattern = {'*.tex'},
  command = 'silent! !pdflatex % > /dev/null 2>&1'
})
