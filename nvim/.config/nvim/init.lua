-- Tronje's neovim config
-- Now written in Lua (hot dang!)

-- MUST come first!
require('plugins')

-- now all the other stuff, order shouldn't be important
require('basics')
require('airline')
require('lsp_stuff')
require('nerdtree')
require('telescope_stuff')
require('git')
require('trailing_whitespace')

-- language-specific settings
require('c')
require('cpp')
require('dart')
require('device_tree')
require('docker')
require('python')
require('rust')
require('systemd')
require('yaml')
require('sessions')
