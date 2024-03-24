#!/bin/bash

tldrf() {
  # tldr: https://github.com/tldr-pages/tldr
  # Installed tldr using node client: https://github.com/tldr-pages/tldr-node-client
  TLDR_LIST=$(tldr --list --linux| tr ', ' '\n')
  echo -e "$TLDR_LIST" | fzf --preview "tldr {1} --theme=ocean" | xargs tldr --theme=ocean
}

