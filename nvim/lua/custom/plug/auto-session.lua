return {
    'rmagatti/auto-session',
    lazy = true,
    cmd = {
        'SessionSave',
        'SessionRestore',
        'SessionDelete',
        'SessionList',
        'SessionToggleAutoSave',
    },

    ---enables autocomplete for opts
    ---@module "auto-session"
    opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        enabled = true, -- Enables/disables auto creating, saving and restoring
        root_dir = vim.fn.stdpath "data" .. "/sessions/", -- Root dir where sessions will be stored
        auto_save = true, -- Enables/disables auto saving session on exit
        auto_restore = false, -- Enables/disables auto restoring session on start
        auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
        suppressed_dirs = {"~/Downloads", "~/.git", "~/.ssh" }, -- Suppress session restore/create in certain directories
        allowed_dirs = {"~/pers/", "~/.local/", "~/.config/", "~/packages/" }, -- Allow session restore/create in certain directories
        auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
        use_git_branch = false, -- Include git branch name in session name
        lazy_support = true, -- Automatically detect if Lazy.nvim is being used 
        bypass_save_filetypes = nil, -- List of filetypes to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
        close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
        args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
        args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument 
        continue_restore_on_error = false, -- Keep loading the session even if there's an error
        show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
        cwd_change_handling = true, -- Follow cwd changes, saving a session before change and restoring after
        lsp_stop_on_restore = false, -- Should language servers be stopped when restoring a session. Can also be a function that will be called if set. Not called on autorestore from startup
        restore_error_handler = nil, -- Called when there's an error restoring. By default, it ignores fold errors otherwise it displays the error and returns false to disable auto_save
        log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).

        session_lens = {
            -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
            load_on_setup = false,
            previewer = true,
            mappings = { },
            theme_conf = {
                border = true,
            },
        },

    }
}

