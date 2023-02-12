# prebuilts_gettext for AOSP
Statically compiled gettext built from hhttps://ftp.gnu.org/pub/gnu/gettext/
Since gettext build process from source code is complicated, requires pulling gnulib submodule etc., it's significantly easier to have compiled prebuilts within the AOSP source tree. Using the tools in host system's `$PATH` is not recommended due to potential build reproducabiliy issues.

Build instructions:
```
$ ./update.sh "0.21.1"
```
