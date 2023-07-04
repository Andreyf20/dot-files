Location for this dir should be -> /home/USER/.config/nvim

Make sure to install gcc g++ ripgrep unzip which are needed for some plugins

LS:

- npm i -g typescript typescript-language-server // for typescrit and javascript
- npm i -g vscode-langservers-extracted // for typescritp and javascript
- asdf plugin add lua-language-server && asdf install lua-language-server latest && asdf global lua-language-server latest

Linters:

- npm i -g eslint_d // for javascript, typescript
- npm i -g @fsouza/prettierd // for javascript, typescript ??
- pip install --upgrade autopep8 // for python might need to install pip first
- dotnet tool install csharpier -g // for csharp
- Read ElixirLs section
- asdf plugin add lua-language-server && asdf install lua-language-server latest && asdf global lua-language-server latest
- go install github.com/incu6us/goimports-reviser@latest
- go install mvdan.cc/gofumpt@latest
- go install github.com/segmentio/golines@latest

When adding new language need to change:

- null.lua // Auto formatting, formatting on save
- lsp.lua // Language server
- treesitter.lua // Syntax highlighting

ElixirLs // MAKE SURE TO INSTALL THE EXACT VERSIONS (These versions are the only ones that have worked for me so far every other attempt has been just errors everywhere)

- install elixir and erlang with [asdf](https://asdf-vm.com/guide/getting-started.html)
- asdf plugin add [erlang](https://github.com/asdf-vm/asdf-erlang.git)
- asdf plugin-add [elixir](https://github.com/asdf-vm/asdf-elixir.git)
- sudo apt install automake autoconf libncurses5-dev // called ncurses in Arch
- asdf install erlang 25.3.2.2
- asdf global erlang 25.3.2.2
- asdf install elixir 1.14.4-otp-25
- asdf global elixir 1.14.4-otp-25
- mix local.hex
- download [elixirls](https://github.com/elixir-lsp/elixir-ls/releases) // Version 0.15.0 is the one that worked for the elixir and erlang versions installed
- unzip elixir-ls-v0.15.0.zip -d ~/.elixirls // I usually do ~/.elixirls which won't require to change the lsp.lua file
