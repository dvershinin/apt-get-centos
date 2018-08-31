#!/bin/bash

shopt -s expand_aliases
alias errcho='>&2 echo'

yes=""
while getopts ":y" opt; do
  case $opt in
    y)
      yes="-y"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "$1" ]
then
    errcho "A command is required."
    exit 1
else
    command="$1"
fi
case $command in
    update )
        yum makecache fast
        echo "Next time you may want to use: yum makecache fast"
    ;;
    install )
        yum $yes install $2
        echo "Next time you may want to use: yum install $2"
    ;;
esac
