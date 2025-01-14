#!/usr/bin/env bash

set -x
set -e

asdf update
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add postgres https://github.com/smashedtoatoms/asdf-postgres.git

asdf install erlang latest; asdf global erlang latest
asdf install elixir latest; asdf global elixir latest
asdf install ruby latest; asdf global ruby latest
asdf install nodejs latest; asdf global nodejs latest
asdf install postgres latest; asdf global postgres latest

mkdir ~/github
cd github
git clone git@github.com:bencheeorg/benchee.git
cd benchee
asdf install
mix deps.get && mix test
