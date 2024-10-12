# Description

[KISS](https://en.wikipedia.org/wiki/KISS_principle) plugin.
Removes unwanted tabs and trailing whitespace. Nothing more, nothing less.

# Features

* Removes trailing whitespace globally
* Removes trailing tabs globally
* Removes whitespace on empty lines
* Removes tabs on empty lines

# Installation

Use your favorite plugin manager.

## Vim

[Vim-plug](https://github.com/junegunn/vim-plug/blob/master/README.md)

```vim
call plug#begin()
Plug 'MikeHorn-git/ctws.vim'
call plug#end()
```

## Neovim

[Lazy](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
    "MikeHorn-git/ctws.vim"
})
```

# Autocmd

Modify the filetypes as needed. It's better to specify the exact filetypes you want to support. Certain filetypes, like [Markdown](https://www.markdownguide.org/basic-syntax/#line-break-best-practices), require trailing whitespace for specific purposes.

## Vim

```vim
autocmd BufWritePre *.c *.py *.sh *.vim call CleanTrailingWhitespaceAndTabs()
```

## Neovim

```lua
vim.cmd([[
  autocmd BufWritePre *.c,*.py,*.sh,*.vim call CleanTrailingWhitespaceAndTabs()
]])
```

# Shortcut

## Vim

```vim
nnoremap <Leader>ctws :Ctws<CR>
```

## Neovim

```lua
vim.keymap.set("n", "<leader>ctws", vim.cmd.Git) -- Ctws [Clean Trailing WhiteSpace]
```

# Why not use :s[ubstitute] ?

[Dangerous commands](https://google.github.io/styleguide/vimscriptguide.xml?showone=Dangerous_commands#Dangerous_commands) :
Avoid using :s[ubstitute] as it moves the cursor and prints error messages. Prefer functions (such as search()) better suited to scripts.
For many vim commands, functions exist that do the same thing with fewer side effects. See :help functions() for a list of built-in functions.

# Credits

* [Google Vimscript Style Guide](https://google.github.io/styleguide/vimscriptguide.xml)
* [Vi.Stackexchange](https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file)
* [Vim.Fandom](https://vim.fandom.com/wiki/Remove_unwanted_spaces#Simple_commands_to_remove_unwanted_whitespace)
