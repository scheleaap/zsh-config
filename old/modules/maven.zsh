autoload -U colors && colors

# Colorize Maven
function mvn-colorized() {
  local opt="\{0,1\}"
  'mvn' $@ | sed \
        -e "s|^\(\[INFO\] -----.*\)|${fg[default]}\1$reset_color|" \
        -e "s|^\(\[INFO\] Building \)\([^ ]*\)\([^ ]*\)|${fg[blue]}\1${fg[cyan]}\2${fg[default]}\3$reset_color|" \
        -e "s|^\(\[INFO\] --- .*\)|${fg[default]}\1$reset_color|" \
        -e "s|^\(\[WARNING\] .*\))|${fg[yellow]}\1$reset_color|" \
        -e "s|^\(\[ERROR\] .*\)|${fg[red]}\1$reset_color|" \
        -e "s|^\(-----.*\)|${fg[default]}\1$reset_color|" \
        -e "s|^\( ${opt}T E S T S\)|${fg[blue]}\1$reset_color|" \
        -e "s|^\(Results :\)|${fg[default]}\1$reset_color|" \
        -e "s|^\(Tests run: \)\(.*\)\(, Failures: \)\(.*\)\(, Errors: \)\(.*\)\(, Skipped: \)\([^,]*\)\(, .*\)${opt}|${fg[default]}\1${fg[default]}\2${fg[default]}\3${fg[yellow]}\4${fg[default]}\5${fg[red]}\6${fg[default]}\7${fg[cyan]}\8${fg[white]}\9$reset_color|" \
        -e "s|^\(\[INFO\] \)\([^ ]* \)\(\.*\)\( SUCCESS \)\(\[.*\]\)|${fg[default]}\1${fg[cyan]}\2${fg[white]}\3${fg[green]}\4${fg[white]}\5$reset_color|" \
        -e "s|^\(\[INFO\] \)\([^ ]* \)\(\.*\)\( FAILURE \)\(\[.*\]\)|${fg[default]}\1${fg[cyan]}\2${fg[white]}\3${fg[red]}\4${fg[white]}\5$reset_color|" \
        -e "s|^\(\[INFO\] \)\([^ ]* \)\(\.*\)\( SKIPPED \)|${fg[default]}\1${fg[cyan]}\2${fg[white]}\3${fg[red]}\4$reset_color|" \
        -e "s|^\(\[INFO\] \)\(BUILD SUCCESS.*\)|${fg[blue]}\1${fg[green]}\2$reset_color|" \
        -e "s|^\(\[INFO\] \)\(BUILD FAILURE.*\)|${fg[blue]}\1${fg[red]}\2$reset_color|" \
        -e "s|^\(.*\)|${fg[white]}\1$reset_color|"
  return $PIPESTATUS
}
