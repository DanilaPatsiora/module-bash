map() {
  cmd=$1
  for i in $#
  do
   shift
   eval $cmd "$1"
  done
}
