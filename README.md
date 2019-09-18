# python-print.vim
Simple vim plugin to add print satements to python scripts for low level debugging.

Easily add a `print('variable_name', variable_name)` or a `print(1)` to your code! Having bad debugging practices has never been easier.
When finished, say goodbye to erroneous artefact print statements by deleting all generated print statements.

## Installation:
### Vundle
add the following to your .vimrc:

```
Plugin 'Hixan/python-print.vim'
```

Then run `PluginInstall` when you next enter vim.

### Pathogen
clone this repository into your vimfiles/bundle directory

## Enabling Key Bindings
adding these lines will assign my preferred keybindings:
```
nnoremap <leader>p :call PPInsertCounterPrint()<CR>
nnoremap <leader>d :call PPClearPrints()<CR>
```


## TODO
* create a vim doc file
