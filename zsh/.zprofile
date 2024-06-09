# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# MacOS ships with an older version of Ruby which is built against an X86
# system rather than ARM i.e. for M1+. So replace the system ruby with an
# replace sys ruby with updated Homebrew, ensure it is before /usr/bin/ruby
# Prepend to PATH
export HOMEBREW_PREFIX="$(brew --prefix)"
path=(
  "$HOMEBREW_PREFIX/opt/ruby/bin"
  "$HOMEBREW_PREFIX/lib/ruby/gems/3.0.0/bin"
#  "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
  $path
)

# Save/Restore Shell State
export SHELL_SESSIONS_DISABLE=1

# less-history-file
export LESSHISTFILE=-

