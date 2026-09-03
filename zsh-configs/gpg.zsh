# Must be per-shell: gpg needs the tty of the shell it is signing from.
export GPG_TTY=$(tty)
