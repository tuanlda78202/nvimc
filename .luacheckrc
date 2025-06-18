-- Luacheck configuration for Neovim
std = "luajit"
cache = true

-- Global objects defined by Neovim
read_globals = {
  "vim",
}

-- Allow setting vim globals (this is normal in Neovim configs)
globals = {
  "vim",
}

-- Ignore some common warnings
ignore = {
  "111", -- Setting an undefined global variable
  "112", -- Mutating an undefined global variable
  "113", -- Accessing an undefined global variable
  "121", -- Setting a read-only global variable
  "122", -- Setting a read-only field of a global variable
  "212", -- Unused argument
  "213", -- Unused loop variable
  "431", -- Shadowing an upvalue
  "631", -- Line is too long
}

-- Exclude certain directories
exclude_files = {
  ".luarocks",
  "lua_modules",
}
