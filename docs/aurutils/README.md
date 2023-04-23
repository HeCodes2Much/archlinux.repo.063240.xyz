# Check linuxrepos for download

pacman -Si *linuxrepos/aurutils*

<div class="highlight"><pre class="highlight"><text>
<b>Repository</b>      : linuxrepos
<b>Name</b>            : <a href="../../x86_64/aurutils-13.2-1-any.pkg.tar.zst">aurutils</a>
<b>Version</b>         : 13.2-1
<b>Description</b>     : helper tools for the arch user repository
<b>Architecture</b>    : any
<b>URL</b>             : https://github.com/AladW/aurutils
<b>Licenses</b>        : custom:ISC
<b>Groups</b>          : None
<b>Provides</b>        : None
<b>Depends On</b>      : git  pacutils  curl  perl
<b>Optional Deps</b>   : bash-completion: bash completion
                  zsh: zsh completion
                  devtools: aur-chroot
                  vifm: default pager
                  perl-json-xs: faster JSON serialization
                  ninja: aur-sync ninja support
                  bat: view-delta example script
                  git-delta: view-delta example script
                  setconf: sync-rebuild example script
<b>Conflicts With</b>  : None
<b>Replaces</b>        : None
<b>Download Size</b>   : 112.83 KiB
<b>Installed Size</b>  : 196.95 KiB
<b>Packager</b>        : Wayne Wesley <wayne6324@gmail.com>
<b>Build Date</b>      : Sat 08 Apr 2023 20:42:10 BST
<b>Validated By</b>    : MD5 Sum  SHA-256 Sum  Signature
</text></pre></div>

## How to install from linuxrepos

pacman -S *linuxrepos/aurutils*