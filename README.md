<div align="center">
  <img src="https://user-images.githubusercontent.com/39852038/136669587-d21af0db-4f9a-4b3f-bc87-d61ffa31cc89.png" width="500" />
</div>

Eye friendly, smooth and dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals.

## Installation

1. Install the theme using your Vim plug-in manager of choice (or manually, by placing `colors/nimda.vim` in your `~/.vim/colors/` directory and `autoload/nimda.vim` in your `~/.vim/autoload/` directory.)


2. If you use Vim in a terminal, do the following to test whether your terminal emulator supports [24-bit/"true" color](https://gist.github.com/XVilka/8346728), then add relevant `~/.vimrc` configuration if so:

   _Note: GUI (non-terminal) Vim will always display 24-bit color regardless of the configuration done in this step._

   Run the following snippet in your shell:

   ```shell
   printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
   ```

   If your terminal emulator **does NOT display the word `TRUECOLOR` in red**, it does not support 24-bit color. If you don't want to switch to a different terminal emulator that [supports 24-bit color](https://gist.github.com/XVilka/8346728), **proceed to step 3**.

   If your terminal emulator displays the word `TRUECOLOR` **in red**, it supports 24-bit color, and you should add the following lines to your `~/.vimrc` to enable 24-bit color terminal support inside Vim.

   (If you use [tmux](https://tmux.github.io/), be sure to view the tmux-related notes in the first few lines.)

   ```vim
   "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
   "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
   "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
   if (empty($TMUX))
     if (has("nvim"))
       "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
       let $NVIM_TUI_ENABLE_TRUE_COLOR=1
     endif
     "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
     "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
     " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
     if (has("termguicolors"))
       set termguicolors
     endif
   endif
   ```
3. Add the following to your `~/.vimrc` (below any lines you may have added in steps 1 and 2):

   ```vim
   syntax on
   colorscheme nimda
   ```

## Preview
![2021-10-09_22-39](https://user-images.githubusercontent.com/39852038/136671906-a293a567-f657-410d-b60a-19fe5b43e22b.png)
![2021-10-09_22-35](https://user-images.githubusercontent.com/39852038/136671899-fd7249c3-8d03-4a74-a351-63f57e93659c.png)
![2021-10-09_22-36](https://user-images.githubusercontent.com/39852038/136671901-91f0d1bb-e0be-493a-b507-93ec37fcf531.png)
![2021-10-09_22-37](https://user-images.githubusercontent.com/39852038/136671904-2a22a622-9275-4f8d-b294-731b8afd061a.png)
![2021-10-09_22-38](https://user-images.githubusercontent.com/39852038/136671905-4e2c06e1-be35-4f31-85e4-8b54f8376475.png)

