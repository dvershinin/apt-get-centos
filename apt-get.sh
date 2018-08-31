#!/bin/bash

shopt -s expand_aliases
alias errcho='>&2 echo'

print_usage () {
    errcho "Usage: apt-get <command>"
}

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
    print_usage
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
    remove ) 
        yum $yes remove $2
        echo "Next time you may want to use: yum remove $2"
    ;;
    purge )
	shift;
	for package in $@
        do
            if rpm -q $package > /dev/null ; then
              echo "removing config files for $package"
              for file in $(rpm -q --configfiles $package)
              do
                echo "  removing $file"
                # rm -f $file
              done
              rpm -e $package
            else
              echo "package $package is not installed"
            fi
	done
    ;;
    *)
      errcho 'This command is not implemented. Have a look at "man yum" ?'
    ;;
esac
