local status_ok, db = pcall(require, 'dashboard')
if not status_ok then return end
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

db.default_banner = {
  '',
  '               ▄▄██████████▄▄             ',
  '               ▀▀▀   ██   ▀▀▀             ',
  '       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
  '     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
  '    ████▄ ▄███▀              ▀███▄ ▄████  ',
  '   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
  '   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
  '    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
  '       ███           ▀▀           ███     ',
  '       ██████████████████████████████     ',
  '   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
  '   ███  ███ ███   ██    ██   ███▄███  ███ ',
  '   ▀██▄████████   ██    ██   ████████▄██▀ ',
  '    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
  '     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
  '       ▀███    ▀▀██████████▀▀▀   ███▀     ',
  '         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
  '               ▀████████████▀             ',
  '',
}

db.custom_footer = {
  '','Pool Temistocles '
}

keymap("n", "<Space>d", '<Cmd> Dashboard <Cr>', opts)
