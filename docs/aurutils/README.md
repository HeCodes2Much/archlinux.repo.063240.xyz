# Check linuxrepos for download

pacman -Si *linuxrepos/aurutils*

<div class="highlight"><pre class="highlight"><text>
<b>Repository</b>      : linuxrepos
<b>Name</b>            : <a href="../../x86_64/aurutils-20-1-any.pkg.tar.zst">aurutils</a>
<b>Version</b>         : 20-1
<b>Description</b>     : helper tools for the arch user repository
<b>Architecture</b>    : any
<b>URL</b>             : https://github.com/AladW/aurutils
<b>Licenses</b>        : ISC
<b>Groups</b>          : None
<b>Provides</b>        : None
<b>Depends On</b>      : git  pacutils  curl  perl  perl-json-xs  bash
<b>Optional Deps</b>   : bash-completion: bash completion
                  zsh: zsh completion
                  devtools: aur-chroot
                  vifm: default pager
                  ninja: aur-sync ninja support
                  bat: view-delta example script
                  git-delta: view-delta example script
                  python-srcinfo: sync-rebuild example script
<b>Conflicts With</b>  : None
<b>Replaces</b>        : None
<b>Download Size</b>   : 122.77 KiB
<b>Installed Size</b>  : 227.66 KiB
<b>Packager</b>        : HeCodes2Much <wayne6324@gmail.com>
<b>Build Date</b>      : Thu 05 Sep 2024 12:56:00 BST
<b>Validated By</b>    : SHA-256 Sum
</text></pre></div>

## How to install from linuxrepos

pacman -S *linuxrepos/aurutils*
