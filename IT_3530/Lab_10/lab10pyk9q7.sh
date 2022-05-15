#!/bin/bash

echo "Hi $USER"
echo "Today's is $(date)"
divider="========================"


main_menu(){
	echo $divider
	echo "        Main Menu" 
	echo $divider
	echo "1. Operating system info"
	echo "2. Network info"
	echo "3. User's information"
	echo "4. File operations"
	echo "5. Find files"
	echo "6. Exit"
	echo "Enter your choice [1-6]"
	read CHOICE
	sub_menu	
}

sub_menu(){
	if [ $CHOICE == 1 ]
	then
		echo "1. Type of OS(distribution)"
		echo "2. Free and used memory(RAM)"
		echo "3. Disk usage(Hard Drivie information)"
		echo "4. System Uptime"
		echo "Enter your choice[1-4]"
		read OPTIONS
		choice_1_submenu
		main_menu
	elif [ $CHOICE == 2 ]
	then
		choice_2_submenu
		main_menu
	elif [ $CHOICE == 3 ]
	then
		echo "1. Who is currently online"
		echo "2. Last logged in users to this system"
		echo "Enter your choice [1 or 2]"
		read OPTIONS
		choice_3_submenu
		main_menu
	elif [ $CHOICE == 4 ]
	then
		echo "1. Create a file"
		echo "2. Delete a file"
		echo "3. Create a directory"
		echo "4. Delete a directory"
		echo "5. Compress a file(s)"
		echo "6. Decompress an archive"
		echo "Enter your choice [1-6]"
		read OPTIONS
		choice_4_submenu
		main_menu
	elif [ $CHOICE == 5 ]
	then
		echo "1. Find files that were modified in the last days"
		echo "2. Find all files with a specific extension"
		echo "Enter your choice [1 or 2]"
		read OPTIONS
		choice_5_submenu
		main_menu
	elif [ $CHOICE == 6 ]
	then
		echo "bye"
		exit
	else
		echo "You should only select from [1-6]"
		main_menu
	fi
}

choice_1_submenu(){
	if [ $OPTIONS == 1 ]
	then
		uname -a	
	elif [ $OPTIONS == 2 ]
	then
		free
	elif [ $OPTIONS == 3 ]
	then
		lsblk
	elif [ $OPTIONS == 4 ]
	then
		uptime
	else
		echo "Please only select from [1-4]"
		
		sub_menu
	fi
}

choice_2_submenu(){
	ifconfig
}

choice_3_submenu(){
	if [ $OPTIONS == 1 ]
	then
		who
	elif [ $OPTIONS == 2 ]
	then
		last -n 1
	else
		echo "Please only select from [1 or 2]"
		sub_menu
	fi
}

choice_4_submenu(){
	if [ $OPTIONS == 1 ]
	then 
		echo "Enter the file to be created"
		read createFile
		checkIfFileExist
	elif [ $OPTIONS == 2 ]
	then
		echo "Enter the file to be deleted"
		read deleteFile
		checkIfFileDeleteSuccess
	elif [ $OPTIONS == 3 ]
	then
		echo "Enter the directory to be created"
		read createDir
		mkdir -p $createDir
		askForFilePermission
	elif [ $OPTIONS == 4 ]
	then
		echo "Enter the directory to be removed"
		read deleteDir
		rm -r $deleteDir
		checkIfDirDeleteSuccess
	elif [ $OPTIONS == 5 ]
	then
		echo "Enter the wildcard expression to archive matching files"
		read archiveWildcard
		tar -cvf archive_$archiveWildcard.tar $archiveWildcard
	elif [ $OPTIONS == 6 ]
	then
		echo "Enter the name of the archive to decompress"
		read decompressArchive
		tar -xvf $decompressArchive
	else
		echo "Please only select from [1-6]"
		sub_menu
	fi

}

choice_5_submenu(){
	if [ $OPTIONS == 1 ]
	then
		echo "Enter the minimum number of days passed since modification"
		read minDays
		find -mtime -$minDays
	elif [ $OPTIONS == 2 ]
	then
		echo "Enter the extension (ex. "txt" to search for)"
		read ext
		find *$ext
	else
		echo "Please only select from [1 or 2]"
		sub_menu
	fi
}

#Bonus Functions

# check for file creation
checkIfFileExist(){
	if ! [ -e $createFile ]
	then
		touch $createFile
	elif [ -e $createFile ]
	then
		echo "File name already exist. Would you like to overwrite $createFile? [y/n]"
read overwriteANS
		if [ $overwriteANS == "y" ] || [ $overwriteANS == "Y" ]
		then
			echo " " > $createFile
		elif [ $overwriteANS == "n" ] || [ $overwriteANS == "N" ]
		then
			sub_menu
		else
			echo "Please only enter [y/n]"
			read overwriteANS
			checkIfFileExist
		fi
	fi
}

# checking for file deletion
checkIfFileDeleteSuccess(){
	if [ -e $deleteFile ]
	then
		rm $deleteFile
		echo "File was removed successfully"
	else
		#to get default error message
		rm $deleteFile
		echo "Deletion was not successful"
	fi	
}

# After create directory ask for OCTAL
askForFilePermission(){
	
	echo "Specify the permission for this new directory[4 Octal Digit]:"
	read OCTAL
	# ${#value} to get the length of the value
	if [ ${#OCTAL} -eq 4 ]
	then
		chmod $OCTAL $createDir
		echo "Permission changed successfully"
	else
		echo "Please make sure you got 4 digits"
		askForFilePermission
	fi
}

# checking for directory deletion (using exit with 0)
checkIfDirDeleteSuccess(){
	if [ $? -eq 0 ]
	then
		echo "The directory was removed successfully"
	else
		echo "The deletion of the directory failed"
	fi
}

# Display main menu
main_menu


