# Guide

Location for this dir should be -> /home/USER/.config/nvim
Make sure to install **gcc g++ fd ripgrep unzip** which are needed for some plugins

## Added languages

- Lua
- Typescript, Javascript, CSS
- Rust
- Python
- Go
- C#
- Swift (MacOS only maybe?)

### LS

- npm i -g typescript typescript-language-server
- npm i -g vscode-langservers-extracted
- swift sourcekit-lsp should be installed with xcode

### Treesitter

- swift installation requires nodejs for some reason

### Install formatters manually

- pip install black
- brew install swiftformat

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
- conform.lua <!-- Formatter -->
