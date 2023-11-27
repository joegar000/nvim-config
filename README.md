# nvim-config
My NeoVim configuration. Based heavily on [the Primeagen's](https://github.com/ThePrimeagen/init.lua/tree/master)

## Handy keymaps that you should remember
NOTE: <leader> is the Space character

NOTE 2: Look [here](https://github.com/joegar000/nvim-config/blob/main/lua/myconfig/remap.lua) for custom remaps

### General
`<C-w-s>` -- window down

`<C-w-v>` -- window right

`<C-w-n>` -- window empty

`<C-[hjkl]>` -- window nav


### Nvim Tree
`<leader>pv` -- toggle nvim-tree

### Nvim Surround
`ysiw(char)` -- surround within char

`ysaw(char)` -- surround around char

`ds(char)` -- delete char


### Fugitive
`<leader>gs` -- use fugitive git stuff (not quite sure how to use this yet)

### Harpoon
`<leader>e` -- show harpooned files quick menu

`<leader>a` -- mark a file for harpoon


### LSP Zero
`gd` -- go to definition

`K` -- hover

`<leader>vws` -- workspace symbol

`<leader>vd` -- open float

`[d` -- goto next diagnostic

`]d` -- goto previous diagnostic

`<leader>vca` -- code action

`<leader>vrr` -- show references

`<leader>vrn` -- rename

`insert<C-h>` -- shows function signature help while in insert mode

`<C-n>` -- select next suggestion item

`<C-p>` -- select prev suggestion item

`<C-y>` -- select selected suggestion item

`<C-Space>` -- cmp.mapping.complete() (i.e. I'm not sure what this one does

`:Mason` -- popup for installed and available LSPs


### Telescope
`<leader>ff` -- find files

`<leader>gf` -- find git files

`<leader>ps` -- grep files (requires [ripgrep](https://github.com/BurntSushi/ripgrep))

`normal<C-c>` -- close search


### Tree-sitter
`:TSPlaygroundToggle` -- Toggle tree-sitter playground


### Undo Tree
`<leader>u` -- Toggle undo tree

