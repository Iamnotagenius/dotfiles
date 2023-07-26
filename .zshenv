source ~/.config/.aliasrc
. "$HOME/.cargo/env"

export ASPNETCORE_Kestrel__Certificates__Default__Path=~/.aspnet/https/localhost.pfx
export ASPNETCORE_Kestrel__Certificates__Default__Password=aspnetisshit

export QT_STYLE_OVERRIDE=kvantum
export PATH=$PATH:~/.local/bin:~/go/bin:~/.yarn/bin
export TEXMFHOME=~/.texmf/
export NEOVIDE_MULTIGRID=true
export GDK_CORE_DEVICE_EVENTS=1
export DMENU="bemenu"
export BEMENU_OPTS="-n --fn 'Iosevka 16' -H 25 \
    --cw 2 --ch 22 \
    --hp 10 \
    --tb #282C34 --tf #56B6C2 \
    --fb #282C34 --ff #ABB2BF \
    --nb #282C34 --nf #ABB2BF \
    --ab #282C34 --af #ABB2BF \
    --hb #383B41 --hf #98C379 \
    --sb #E06C75"

export MANPAGER='nvim +Man!'
