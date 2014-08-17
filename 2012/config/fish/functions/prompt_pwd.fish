function prompt_pwd --description "Print the current working directory, shortend to fit the prompt"
  switch "$PWD"
    case "$HOME"
    echo '~'

    case ""
    echo '/'

    case '*'
    printf "%s" (echo $PWD | sed -e "s|^$HOME|~|" -e 's-/\(\.\{0,1\}[^/]\)\([^/]*\)-/\1-g')
    echo $PWD | sed -n -e 's-.*/\.\{0,1\}.\([^/]*\)-\1-p'
  end
end
