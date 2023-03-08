local dap = require "dap"

dap.adapters = astronvim.user_plugin_opts("dap.adapters", dap.adapters)
dap.configurations = astronvim.user_plugin_opts("dap.configurations", dap.configurations)

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file: ', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > ' .. default_path .. 'build.log'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == true then
        print('\nBuild: ')
    else
        print('\nBuild:  (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request_project_dir = function()
        return vim.fn.input('Project dir: ', vim.fn.getcwd() .. '/', 'file')
    end

    local request_dll = function()
        return vim.fn.input('Dll name: ', 'bin/Debug/net7.0/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request_project_dir() .. '/' .. request_dll()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&y\n&n', 2) == 'y' then
            vim.g['dotnet_last_dll_path'] = request_project_dir() .. '/' .. request_dll()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local dap_dotnet_config = {
    {
        type = "coreclr",
        name = "Launch - netcoredbg",
        request = "launch",
        console = "integratedTerminal",
        program = function()
            if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
                vim.g.dotnet_build_project()
            end
            return vim.g.dotnet_get_dll_path()
        end,
    }
}

local dap_python_config = {
    {
        name = 'Launch doopass tui',
        type = 'python',
        request = 'launch',
        module = 'doopass.doopass',
        cwd = vim.fn.getcwd(),
        console = 'externalTerminal',
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end;
    },
    {
        name = 'Launch',
        type = 'python',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        console = 'externalTerminal',
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end;
    }
}

dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/gnome-terminal',
    args = {"--"}
}

dap.configurations = {
    python = dap_python_config,
    cs = dap_dotnet_config,
    fsharp = dap_dotnet_config
}
