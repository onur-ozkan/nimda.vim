<div align="center">
  <img src="https://user-images.githubusercontent.com/39852038/136669587-d21af0db-4f9a-4b3f-bc87-d61ffa31cc89.png" width="500" />
  <h3> an alternative dark color scheme for vim </h3>
  <br/>
  <img src="https://user-images.githubusercontent.com/39852038/153703108-5e40a9ac-e3a2-43e1-a630-9a92a4454c1b.png" />
</div>

## Color References
![2021-10-10_00-10](https://user-images.githubusercontent.com/39852038/136673888-9b59c245-9e70-4db4-9e2a-2b54cc437d9b.png)
![2021-10-10_00-11](https://user-images.githubusercontent.com/39852038/136673887-e1487709-0a6e-473a-a46d-3152fb3710c9.png)

## Installation

1. Install the color scheme using your Vim plug-in manager of choice (or manually, by placing `colors/nimda.vim` in your `~/.vim/colors/` directory and `autoload/nimda.vim` in your `~/.vim/autoload/` directory.)


2. If you use Vim in a terminal, the terminal 'must' support the True Color(24-bit) in order to have best experience from the color scheme. So, do the following to test whether your terminal emulator supports [24-bit/"true" color](https://gist.github.com/XVilka/8346728):

   _Note: GUI (non-terminal) Vim will always display 24-bit color regardless of the configuration done in this step._

   Run the following snippet in your shell:

   ```shell
   printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
   ```

3. Add the following lines to your `.vimrc` or `init.vim`:

   ```vim
   syntax on
   set termguicolors
   colorscheme nimda
   ```

