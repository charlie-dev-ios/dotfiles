#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

ENV_DIR="$HOME/.config/env"
# export GITHUB_TOKEN=$(cat ${ENV_DIR}/.github_token)

export HOMEBREW_FORBIDDEN_FORMULA="node python python3 pip npm pnpm yarn claude"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
