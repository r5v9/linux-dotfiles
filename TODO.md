
- chrome
- visual studio code
- parcellite
- redshift
- intellij
- vpn
- spotify
- virtualbox
- vmware player
- docker
- fonts
- themes
- keyboard
- password manager
- dropbox
- firewall

monitoring
htop
glances

catfish
sudo apt-get install doublecmd-gtk pavucontrol p7zip-rar catfish

sysctl.conf
sudo cp /etc/sysctl.conf /etc/sysctl.conf.orig
sudo cp sysctl.conf /etc/sysctl.conf

/usr/share/themes/Mint-Y-Dark/cinnamon/cinnamon.css
.menu-search-box:ltr { height: 40px;

runenpass.sh
export HIDE_TOOLBAR_LINE=1
export QT_STYLE_OVERRIDE=fusion

keyboard config:
cd /usr/share/X11/xkb
cat > types/cutpaste <<EOS
default partial xkb_types "addsuper" {
    type "ALPHABETIC_SUPER" {
        modifiers= Shift+Lock+Mod4;
        map[Shift]= Level2;
        map[Lock]= Level2;
        map[Mod4]= Level3;
        map[Shift+Mod4]= Level3;
        map[Lock+Mod4]= Level3;
        level_name[Level1]= "Base";
        level_name[Level2]= "Caps";
        level_name[Level3]= "With Super";
    };
};
EOS

cat > symbols/cutpaste <<EOS
default partial xkb_symbols "superversions" {
    replace key <AB02> {
        type[Group1]= "ALPHABETIC_SUPER",
        symbols[Group1]= [               x,               X, NoSymbol ],
        actions[Group1]= [      NoAction(),      NoAction(), RedirectKey(key=<LatX>,mods=Control,clearmods=Super)]
    };
    replace key <AB03> {
        type[Group1]= "ALPHABETIC_SUPER",
        symbols[Group1]= [               c,               C, NoSymbol ],
        actions[Group1]= [      NoAction(),      NoAction(), RedirectKey(key=<LatC>,mods=Control,clearmods=Super)]
    };
    replace key <AB04> {
        type[Group1]= "ALPHABETIC_SUPER",
        symbols[Group1]= [               v,               V, NoSymbol ],
        actions[Group1]= [      NoAction(),      NoAction(), RedirectKey(key=<LatV>,mods=Control,clearmods=Super)]
    };
};
EOS

edit rules/evdev, after:
! option =   symbols
add:
cutpaste:super      = +cutpaste

after:
! option    =   types
add:

edit rules/evdev.lst, after
! option
add:
cutpaste:super     Add super equivalents of cut and paste operations

setxkbmap -option cutpaste:super
