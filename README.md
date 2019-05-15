# python-print.vim
Simple vim plugin to add print satements to python scripts for low level debugging.

## Installation:
### Vundle
add the following to your .vimrc:

```
Plugin 'Hixan/python-print.vim'
```

Then run `PluginInstall` when you next enter vim.

### Pathogen
clone this repository into your vimfiles/bundle directory

### Enabling Key Bindings
adding these lines will assign my preferred keybindings:
```
nnoremap <leader>p :call PPInsertCounterPrint()<CR>
nnoremap <leader>d :call PPClearPrints()<CR>
```
they are defaulted to  `\p` for adding a print statement and `\d` for deleting all print statements (including the tracker comment)
