print('Hello from copypasta!')

local DEFAULT_CONFIGURATION = {
    install_root_dir = vim.fn.stdpath "data" .. "/wsl-copypasta",
}

local configuration = DEFAULT_CONFIGURATION


local function download()
    -- retrieve the content of a URL
    local http = require("socket.http")
    local body, code = http.request("https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip")
    if not body then error(code) end

    -- save the content to a file
    local f = io.tmpfile()
    f:write(body)
    f:close()
end

local function setup(parameters)
    for k,v in pairs(parameters) do configuration[k] = v end
end

download()

return {
    setup = setup,
}
