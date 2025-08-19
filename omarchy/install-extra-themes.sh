wget -qO- https://manuals.omamix.org/2/the-omarchy-manual/90/extra-themes |
    sed -n 's#.*href="\(https://github.com[^"]*\)".*#\1#p' |
    xargs -n1 omarchy-theme-install
