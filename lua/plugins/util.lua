return {
  -- {
  --     lazy = true,
  --     'eandrju/cellular-automaton.nvim'
  -- },
  -- {
  --     'alec-gibson/nvim-tetris',
  --     cmd = 'Tetris'
  -- },
  {
    "frabjous/knap",
    ft = 'tex',
    config = function()
      vim.g.knap_settings = {
        texoutputext = "pdf",
        textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
        textopdfviewerlaunch =
        "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --new-window %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump =
        "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
        -- textopdfshorterror = "A=%outputfile% ; LOGFILE=\"${A%.pdf}.log\" ; rubber-info \"$LOGFILE\" 2>&1 | head -n 1",
        textopdfbufferasstdin = false,
        delay = 1000
      }
      vim.api.nvim_create_user_command('KnapOpen', function() require('knap').process_once() end, {})
      vim.api.nvim_create_user_command('KnapClose', function() require('knap').close_viewer() end, {})
      vim.api.nvim_create_user_command('KnapTogglePreview', function() require('knap').toggle_autopreviewing() end, {})
      vim.api.nvim_create_user_command('KnapJump', function() require('knap').forward_jump() end, {})
    end
  },
  { 'numToStr/Comment.nvim', config = true, lazy = false },
  { 'kkharji/sqlite.lua',    lazy = false },
  { 'windwp/nvim-autopairs', config = true, event = 'InsertEnter' },
  {
    'folke/zen-mode.nvim',
    config = true,
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'ZenMode' }
    }
  },
  {
    -- tag = '0.1.1',
    -- Needs to be false because of telescope-ui-select
    lazy = false,
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      -- Native C fzf
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = require('telescope.themes').get_dropdown(),
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
          }
        }
      })
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('fzf')
    end,
    keys = {
      {
        '<leader>ff',
        function() require('telescope.builtin').find_files() end,
        desc = 'Telescope Find Files'
      },
      {
        '<leader>fa',
        function() vim.lsp.buf.code_action() end,
        mode = { 'v', 'n' },
        desc = 'Code Actions'
      },
      {
        '<leader>fg',
        function() require('telescope.builtin').live_grep() end,
        desc = 'Telescope Live Grep'
      },
      {
        '<leader>fb',
        function() require('telescope.builtin').buffers() end,
        desc = 'Telescope Buffers'
      },
      {
        '<leader>fh',
        function() require('telescope.builtin').help_tags() end,
        desc = 'Telescope Help Tags'
      },
      {
        '<leader>ft',
        function() require('telescope.builtin').treesitter() end,
        desc = 'Telescope Treesitter'
      },
      {
        '<leader>fm',
        function()
          require('telescope.builtin').man_pages({ 'ALL' })
        end,
        desc = 'Telescope Man Pages'
      },
      {
        '<leader>fc',
        function()
          require('telescope.builtin').colorscheme()
        end,
        desc = 'Telescope Colorschemes'
      },
      {
        '<leader>fk',
        function()
          require('telescope.builtin').keymaps()
        end,
        desc = 'Telescope Keymaps'
      },
    }
  },
  {
    'folke/trouble.nvim',
    config = true,
    cmd = {
      'Trouble',
      'TroubleToggle',
    },
    keys = {
      {
        '<leader>xx',
        '<cmd>TroubleToggle<cr>',
        desc = 'Opens Normal Trouble Diagnostics'
      },
      {
        '<leader>xw',
        '<cmd>TroubleToggle workspace_Diagnostics<cr>',
        desc = 'Opens Trouble Diagnostics for Workspace'
      },
      {
        '<leader>xd',
        '<cmd>TroubleToggle document_Diagnostics<cr>',
        desc = 'Opens Trouble Diagnostics for Diagnostics'
      },
      {
        '<leader>xq',
        '<cmd>TroubleToggle loclist<cr>',
        desc = 'Opens Trouble Diagnostics for loclist'
      },
      {
        '<leader>xl',
        '<cmd>TroubleToggle quickfix<cr>',
        desc = 'Opens Trouble Diagnostics for quickfix'
      },
      {
        '<leader>xr',
        '<cmd>TroubleToggle lsp_references<cr>',
        desc = 'Opens Trouble Diagnostics for lsp lsp_references'
      },
    },
  },
  -- {
  --   'nvim-neorg/neorg',
  --   ft = 'norg',
  --   build = ":Neorg sync-parsers",
  --   opts = {
  --     load = {
  --       ['core.defaults'] = {},
  --       ['core.integrations.nvim-cmp'] = {},
  --       ['core.integrations.treesitter'] = {},
  --       ['core.completion'] = {
  --         config = { engine = 'nvim-cmp' }
  --       },
  --       -- ['core.export'] = {},
  --       ['core.highlights'] = {},
  --       ['core.concealer'] = {
  --         config = {
  --           folds = true,
  --         }
  --       },
  --       -- ['core.autocommands'] = {},
  --     }
  --   },
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   }
  -- },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },


  -- {
  --     'kwakzalver/duckytype.nvim',
  --     cmd = 'DuckyType',
  --     config = true,
  -- },
  {
    'andweeb/presence.nvim',
    lazy = false,
    event = 'BufEnter',
    config = function()
      require('presence').setup({
        -- The setup config table shows all available config options with their default values:
        -- General options
        auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text   = 'The One True Text Editor', -- Text displayed when hovered over the Neovim image
        main_image          = 'file',                     -- Main image display (either 'neovim' or 'file')
        client_id           = '793271441293967371',       -- Use your own Discord application client id (not recommended)
        log_level           = nil,                        -- Log messages at or above this level (one of the following: 'debug', 'info', 'warn', 'error')
        debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number  = true,                       -- Displays the current line number instead of the current project
        blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = '<label>', url = '<url>' }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time           = true,                       -- Show the timer

        -- Rich Presence text options
        editing_text        = 'Editing %s',         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = 'Browsing %s',        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = 'Committing changes', -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = 'Managing plugins',   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = 'Reading %s',         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = 'Working on %s',      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = 'Line %s out of %s',  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end
  }
}
