#!/bin/bash
#This is a script for download Microsoft ebooks.
#Jonathan Harris
#July 15, 2015
clear

echo "Hello this is the easist way to download all the books that are offered free
on certain microsoft programs. For individual books going to to:
http://blogs.msdn.com/b/mssmallbiz/archive/2015/07/07/i-m-giving-away-millions-of-free-microsoft-ebooks-again-including-windows-10-windows-8-1-windows-8-windows-7-office-2013-office-365-sharepoint-2013-dynamics-crm-powershell-exchange-server-lync-2013-system-center-azure-clo.aspx
is the easist way. Though if you want to download them all. Then this script does it for you.
In order for this script to work wget must be installed
on your system."
sleep 5s

#Check which OS is installed.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Detecting a Linux OS, assuming wget is installed"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Detecting an OSX platform. wget may not be installed"
  sleep 2

  #Check for wget if not found then ask to install brew and wget
  if  which wget ; then
    echo "wget was found. Continuing."
    true
  else
    echo "wget could not be found. The use of this script uses the command wget to download all of these files.
    if you would like, this script can download and install it for you if you would like."
    echo "In order to install wget, we need to install brew."
    while true ; do
      read -p "Do you wish to install brew and wget?" yn
      case $yn in
        [Yy]* ) ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew install wget;;
        [Nn]* ) echo "Cannot continue without  install. quiting." exit;;
        * ) echo " Please answer with yes or no.";;
      esac
    done
  fi
else
  echo "Not detecting an compatable OS. Though if you are able to run this script
  wget may be installed."
  sleep 2
  echo "checking for wget."
  if which wget ; then
    echo "wget was found. Continuing."
  else
    echo "wget was not found on this machine. Please install wget and try this script again."
    exit
  fi
fi

download() {
  echo "Downloading all microsoft ebooks"
  sleep 3
  wget --content-disposition -i MSFTEbooks2.txt
}

download
