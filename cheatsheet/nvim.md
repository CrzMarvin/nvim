# nvim
gd
gf
gi
Ctl o
Ctl i
`<leader>ca`
`<leader>rn`
`<leader>d` show eslint info

:q! 退出并不保存 

查看vim option 变量: `:set spell?`

在nvim-tree查看.gitignore隐藏文件
normal H toggles dotfiles  
normal I toggles gitignore

### scroll
`<Ctl>e` oneline down
`<Ctl>y` ondeline up
`<Ctl>u` pageup
`<Ctl>d` pagedown
`z<CR>` scroll to top
z. scroll middle
z- scroll bottom

### fold
`zf{motion} or `{Visual}`zf` 收起
`zF` fold current line
`zd` 展开

:Mason
:LspInfo
:CheckHealth
:so source current file
:PackerSync packer 同步安装插件
[`:help scroll-horizontal`](http://vimdoc.sourceforge.net/htmldoc/scroll.html#scroll-horizontal) 可以查看帮助命令

normal modal: X delete till end of line
normal modal: Y yank till end of line

viw
viW    选择整个词到 white spce
vaw
ya{
yi{

### search
`:s/old/new` search and replace in a line
`:%s/old/new/g` search and replace all
`:5,12s/foo/bar/g`  search and replace from line 5 to line12
`*` for highlight same word
`==` for indent line
nvim runtim path: `/opt/homebrew/Cellar/neovim/0.8.0/share/nvim/runtime/`
`:e $VIMRUNTIME/colors`
Treesitter Highlight Groups  `:e $VIMRUNTIME/syntax`

对选中的进行替换:v模式选中需要修改的片段,然后输入`:s/{from}/{to}`

### lsp saga 快捷键
就是`gf` `gd` 弹出的对话框
```lua
keys = {
      jump_to = 'p',
      edit = { 'o', '<CR>' },
      vsplit = 's',
      split = 'i',
      tabe = 't',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>'
},
```

### article
[basic for nvim](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a)
https://github.com/RRethy/nvim-base16

[nvim colors scheme 原理](https://alpha2phi.medium.com/neovim-for-beginners-color-scheme-e880762c6cc6)

* `:h gruvbox-material` 搜索 `How to use custom colors?`
* https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim

## 目前Mac 上的neovim
因为目前大部分插件不支持neovim0.9，
但是brew install默认安装的就是0.9所以不采用brew安装，而是该用下载的bin文件
**update**
通过下面方法fix了
主要的问题: 0.9内置了 **semantic highlighting** （语法高亮) 会导致 高亮问题
参考[this is why your highlights look different](https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/)
[a guide to semantic highlight](https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316)


## Treesitter 和 LSP 在 Neovim 中的关系:
在 Neovim 中，Treesitter 和 LSP（Language Server Protocol）是两个独立但可以相互配合的技术。

1. Treesitter：
   - Treesitter 是一个用于解析源代码的解析器库和框架。
   - 它通过构建语法树来理解代码的语法结构和层次关系。
   - Treesitter 提供了强大的语法分析功能，可以识别各种编程语言的代码结构，包括函数、类、变量等。
   - Treesitter 还可以进行更高级的分析，如类型推断、语义分析等。

2. LSP（Language Server Protocol）：
   - LSP 是一种协议，定义了客户端和语言服务器之间的通信规范。
   - 语言服务器是一个独立的进程，提供了对特定编程语言的语言功能和工具的支持，如代码补全、语法检查、重构等。
   - Neovim 可以作为一个 LSP 客户端，通过与语言服务器进行通信，获得语言相关的功能和服务。

关于 Treesitter 和 LSP 在 Neovim 中的关系：

- Treesitter 可以作为 LSP 客户端的一个插件，与 LSP 服务器进行交互。
- Treesitter 可以使用自己的解析功能来分析代码并构建语法树，提供更准确和细粒度的代码分析结果。
- 这些分析结果可以与 LSP 服务器交互，为 LSP 提供更丰富的语义信息。
- LSP 服务器可以利用 Treesitter 提供的语法树和其他分析结果，为 Neovim 提供更高级的代码补全、重构、代码导航等功能。

综上所述，Treesitter 和 LSP 在 Neovim 中可以相互配合，Treesitter 提供了更准确和丰富的代码分析能力，而 LSP 则提供了与语言服务器交互的标准化协议和更高级的语言功能。通过将 Treesitter 与 LSP 结合使用，可以提升在 Neovim 中进行代码编辑和开发的体验和效率。
