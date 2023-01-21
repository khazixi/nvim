local dap = require("dap")
vim.keymap.set('n', '<leader>h', function() print("hello") end)

vim.keymap.set('n', '<leader>dc',
    function() require('dap').continue() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>do',
    function() dap.step_over() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>di',
    function() dap.step_into() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>dO',
    function() dap.step_out() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>b',
    function() dap.toggle_breakpoint() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>B',
     function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>dr',
    function() dap.repl.open() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>dl',
    function() dap.run_last() end,
    {noremap = true, silent = true}
)

vim.keymap.set('n', '<leader>dt',
    function() dap.terminate() end,
    {noremap = true, silent = true}
)
