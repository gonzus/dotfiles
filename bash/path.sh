# vi:filetype=sh

delim_to_array() {
    local IFS="${2:-$' :|'}"
    read -ra "$1" <<<"${!1}";
}

check_and_add_to_path() {
    name="${1}"
    before="${@:2}"
    after="${@:3}"

    # split current path into components
    path="${!name}"
    delim_to_array "path"

    # build a new path
    elems=''

    # add requested BEFORE directories
    for x in ${before[@]}; do
        grep -q ":$x:" <(echo ":$elems:")
        if [ $? -eq 0 ]; then
            # skip duplicates
            continue
        fi
        if [ $x == "/*" -a ! -d $x ]; then
            # skip non-dirs when absolute
            continue
        fi
        elems="$elems:$x"
    done

    # add current PATH directories
    for x in ${path[@]}; do
        grep -q ":$x:" <(echo ":$elems:")
        if [ $? -eq 0 ]; then
            # skip duplicates
            continue
        fi
        if [ $x == "/*" -a ! -d $x ]; then
            # skip non-dirs when absolute
            continue
        fi
        elems="$elems:$x"
    done

    # add requested AFTER directories
    for x in ${after[@]}; do
        grep -q ":$x:" <(echo ":$elems:")
        if [ $? -eq 0 ]; then
            # skip duplicates
            continue
        fi
        if [ $x == "/*" -a ! -d $x ]; then
            # skip non-dirs when absolute
            continue
        fi
        elems="$elems:$x"
    done

    # assign back to original variable
    eval $name\=\($elems\)
}

path=${MANPATH:-}
paths_before=( \
    "$HOME/perl5/man" \
    "/usr/local/opt/gnu-tar/libexec/gnuman" \
)
paths_after=( \
)
check_and_add_to_path 'path' ${paths_before[@]} ${paths_after[@]}
export MANPATH="$path"

zig_version=0.8.0
path=${PATH:-}
paths_before=( \
    "./node_modules/.bin" \
    "$HOME/bin/zig-linux-x86_64-${zig_version}" \
    "$HOME/bin" \
    "$HOME/perl5/bin" \
    "/usr/local/opt/node@10/bin" \
    "/usr/local/opt/gnu-tar/libexec/gnubin" \
    "/usr/local/opt/gnu-getopt/bin" \
    "/usr/local/opt/flex/bin" \
    "/usr/local/opt/bison/bin" \
    "/usr/local/opt/llvm/bin" \
)
paths_after=( \
    "/usr/sbin" \
    "/sbin" \
    "$HOME/src/depot_tools" \
)
check_and_add_to_path 'path' ${paths_before[@]} ${paths_after[@]}
export PATH="$path"
