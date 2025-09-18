# autoloaded function (named file = function name)
prev() {
  local PREV
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new $(printf %q "$PREV")"
}

