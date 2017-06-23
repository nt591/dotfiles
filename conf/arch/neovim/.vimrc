"""

" -- here be dragons


" path where configs are stored
let NEOVIM_CONFIG = '$HOME/dotfiles/conf/arch/neovim/'

" configs split up according to functionality
let configs = [
\ 'plugins',
\ 'settings',
\ 'settings.plugins',
\ 'mappings',
\ 'mappings.plugins',
\ 'ui',
\ 'ui.statusline',
\ 'ui.plugins',
\ 'commands',
\ ]

" load all configs
for config in configs
  let configPath = NEOVIM_CONFIG . config . '.vim'
  execute 'source ' . fnameescape(configPath)
endfor
