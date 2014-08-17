function fish_prompt
	set -l pwd (prompt_pwd)

  set -l location (printf '%s%s%s' (set_color $fish_color_cwd) $pwd (set_color normal))

  set -l context
  if not test (hostname) = 'salvador.local' -a (whoami) = (logname)
    set -l who (whoami)

    if test $who = 'root'
      set who (printf '%s%s%s' (set_color red) $who (set_color normal))
    end

    set context (printf '%s@%s ' $who (hostname -s))
  end

  set -l branch
  git rev-parse --git-dir >/dev/null ^/dev/null
  if test $status = 0
    set branch (git branch --no-color | grep '*' | cut -c 3-)

    set -l shortstatus (git status --short)

    set -l color
    if test -n "$shortstatus"
      set color red
    else
      set color cyan
    end

    set branch (printf ' %s%s%s' (set_color $color) $branch (set_color normal))
  end

  set_color normal

	printf '%s%s%s❭ ' $context $location $branch
end
