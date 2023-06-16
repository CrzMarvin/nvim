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
