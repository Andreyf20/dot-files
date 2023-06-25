Location for this file -> /home/USER/.config/nvim

Make sure to install gcc g++ ripgrep which are needed for some plugins

LSP:

- npm i -g typescript typescript-language-server // for typescrit and javascript
- npm i -g vscode-langservers-extracted

Linters:

- npm i -g eslint_d // for javascript, typescript
- npm i -g @fsouza/prettierd // for javascript, typescript ??
- pip install --upgrade autopep8 // for python might need to install pip first
- dotnet tool install csharpier -g // for csharp
- Read ElixirLs section

When adding new language need to change:

- null.lua // Auto formatting, formatting on save
- lsp.lua // Language server
- treesitter.lua // Syntax highlighting

ElixirLs

- Download latest version [elixirls](https://github.com/elixir-lsp/elixir-ls)
- ./language-server.sh // Pray, it's been bugged since at least May 2023... not working for me
