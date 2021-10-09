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

## Preview
![2021-10-09_20-42](https://user-images.githubusercontent.com/39852038/136668855-0fe1bbf7-6200-4a58-9114-1e3dcc9a2b2d.png)
![2021-10-09_20-39](https://user-images.githubusercontent.com/39852038/136668858-33d55db3-0b8f-4f00-899b-82e5182775b3.png)
![2021-10-09_20-34](https://user-images.githubusercontent.com/39852038/136668859-d8192193-5135-4c53-9986-66cec3fa1c0e.png)
