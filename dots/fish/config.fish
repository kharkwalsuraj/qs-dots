set fish_greeting
if status is-interactive

  zoxide init fish | source

  set -gx EDITOR nvim
  set -gx VISUAL nvim
  function starship_transient_prompt_func
        starship module character
  end

  if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
  end

  function f
      set -l path (command fzf --preview 'cat {} 2>/dev/null')
      test -n "$path" || return
      printf '%s' "$path" | wl-copy
  end

  function fe
      set -l path (command fzf --preview 'cat {} 2>/dev/null')
      test -n "$path" || return
      nvim "$path"
  end

  alias nv "nvim"
  alias yy "yazi"
  alias lg "lazygit"
end
