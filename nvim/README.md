# Guide

Location for this dir should be -> /home/USER/.config/nvim
Make sure to install **gcc g++ ripgrep unzip** which are needed for some plugins

## Added languages

- Lua
- Typescript, Javascript, CSS
- Rust
- Python
- Go
- C#

### LS

- npm i -g typescript typescript-language-server
- npm i -g vscode-langservers-extracted

### Install formatters manually

- pip install black

### Install formatters with Mason

- eslint_d <!-- Javascript, Typescript -->
- prettierd
- goimports-reviser <!-- Golang -->
- gofumpt
- golines
- csharpier <!-- C# -->

### When adding new language need to change

- lsp.lua <!-- Language server -->
- treesitter.lua <!-- Syntax highlighting -->
