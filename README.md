<div align="center">
  <img src="https://user-images.githubusercontent.com/39852038/136669587-d21af0db-4f9a-4b3f-bc87-d61ffa31cc89.png" width="500" />
  <br>
  <br>
  <p> Eye friendly and smooth dark color scheme for vim. </p>
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

## Preview
![2021-10-09_22-39](https://user-images.githubusercontent.com/39852038/136671906-a293a567-f657-410d-b60a-19fe5b43e22b.png)
![2021-10-09_22-35](https://user-images.githubusercontent.com/39852038/136671899-fd7249c3-8d03-4a74-a351-63f57e93659c.png)
![2021-10-09_22-36](https://user-images.githubusercontent.com/39852038/136671901-91f0d1bb-e0be-493a-b507-93ec37fcf531.png)
![2021-10-09_22-37](https://user-images.githubusercontent.com/39852038/136671904-2a22a622-9275-4f8d-b294-731b8afd061a.png)
![2021-10-09_22-38](https://user-images.githubusercontent.com/39852038/136671905-4e2c06e1-be35-4f31-85e4-8b54f8376475.png)

