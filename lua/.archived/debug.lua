local dap = require("dap")
local dapui = require("dapui")

-- Adapters

dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
    name = 'lldb'
}

dap.adapters.devle = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = {
            'dap',
            '-l',
            '127.0.0.1:${port}',
        }
    }
}

-- Configurations

dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    }
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

dap.configurations.go = {
    {
        type = 'delve',
        name = 'Debug',
        request = 'launch',
        program = '${file}'
    },
    {
        type = 'delve',
        name = 'Debug Test',
        request = 'launch',
        mode = 'test',
        program = '${file}'
    },
    {
        type = 'delve',
        name = 'Debug Test (go.mod)',
        request = 'launch',
        mode = 'test',
        program = './${relativeFileDirname}'
    },
}

-- Event Listeners
dap.listeners.after.event_initializes['dapui_config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end
