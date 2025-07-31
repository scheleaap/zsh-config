export DEFAULT_PYTHON_VENV_DIR=.venv

function _py_venv_activation_hook() {
  local ret=$?

  if [ -n "$VIRTUAL_ENV" ]; then
    source $DEFAULT_PYTHON_VENV_DIR/bin/activate 2>/dev/null || deactivate || true
  else
    source $DEFAULT_PYTHON_VENV_DIR/bin/activate 2>/dev/null || true
  fi

  return $ret
}

typeset -g -a precmd_functions
if [[ -z $precmd_functions[(r)_py_venv_activation_hook] ]]; then
  precmd_functions=(_py_venv_activation_hook $precmd_functions);
fi
