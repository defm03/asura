PORTAGE_make_conf="source /etc/portage/make.conf"
PORTAGE_package_use="source /etc/portage/package.use"

stdMSG ()
{
	log_msg() 
	{
	    RED=$(tput setaf 1)
	    GREEN=$(tput setaf 2)
	    NORMAL=$(tput sgr0)
	    MSG="$1"
	    let COL=$(tput cols)-${#MSG}+${#GREEN}+${#NORMAL}

	    printf "%s%${COL}s" "$MSG" "[$GREEN OK $NORMAL]"
	}
}

SET_USE_FLAG ()
{
	file=$1
	flags=$2
	if [ "$file" == "make.conf" ]; then
		eval PORTAGE_make_conf
		log_msg "Openning /etc/portage/make.conf file"
		USE_OLD="$USE"
		log_msg "Setting new USE flags."
		USE="$USE_OLD $flags"
	elif [ "$file" == "package.use"]
		eval PORTAGE_package_use
	else 
		echo "Unknown file."
	fi
}