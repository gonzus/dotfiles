# vi:filetype=sh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export JAVA_VERSION=8.0.252-zulu
export JAVA_HOME=$SDKMAN_CANDIDATES_DIR/java/$JAVA_VERSION
