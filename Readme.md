# Migration to NeoVim - Why?
Because I think it was time to start optimizing the way I configure my
day-to-day editor/IDE, and I decided to go to Lua.

Also, I wanted to reduce the size of my config files from:
```
 du -sh legacy
724K    legacy
```

To:
```
~/.config/nvim
 du -sh .
16K     .
```

For this setup I'm using [lazy.nvim](https://github.com/folke/lazy.nvim) and
a bunch of custom configs.

# Old code:
It's under the `legacy` directory, so the instructions are a bit different:

```
git clone git@github.com:boris/vim.git <somewhere>
ln -s ~/<somewheere>/legacy/vimrc ~/.vimrc
```

After that, open vim and run `PlugInstall` (vim, :PlugInstall)
