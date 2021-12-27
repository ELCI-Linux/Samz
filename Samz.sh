#! /bin/bash/
				#Build detection
				lsb=$(lsb_release -r | cut -f2)
				if [ $lsb = '21.04' ]; then
				tag='hirsuite' & TAG='HIRSUITE'
				elif [ $lsb = '20.04' ]; then
				tag='focal' & TAG='FOCAL'
				elif [ $lsb = '18.04' ]; then
				tag='bionic' & TAG='BIONIC'
				elif [ $lsb = '16.04' ]; then
				tag='xenial' & TAG='XENIAL'
				fi

helper='Samz'
versnum='2.1'

samz=$(zenity --list --checklist --title="Samz" \
	 --text="Select the Finance software you would like to install:" \
	--height=355 --width=650 \
	--column="Selected" --column="Software" --column="Description" \
	"" "ARK Desktop Wallet" "Buy, delegate and store ARK from your desktop" \
	"" "Atomic Wallet" "Privacy centric BTC and ERC-20 exchange and wallet" \
	"" "Binance Desktop Application" "Trade Crypto on the Binance Smart Chain" \
	"" "BitCoin Core" "Connect To BitCoin P2P Network" \
	"" "PeerCoin" "Wallet for PeerCoin" \
	"" "Storj Node" "Operate a Storj Node" \
	"" "TastyWorks" "Forex Trading Platform" \
	"" "XMRig" "CPU/GPU Mining" \
	"" "Wasabi" "Privacy Centric BTC wallet with support for hardware wallets")

	ARK=$(echo $samz | grep -c "ARK" ); ATOMIC=$(echo $samz | grep -c "Atomic")
	 BTC=$(echo $samz | grep -c "BitCoin" ); NANCE=$(echo $samz | grep -c "Binance" )
	PEERCOIN=$(echo $samz | grep -c "PeerCoin" ); STORJNODE=$(echo $samz |grep -c "Storj Node") TASTY=$(echo $samz | grep -c "TastyWorks" );  WASABI=$(echo $samz | grep -c "Wasabi" )
	XMRIG=$(echo $samz | grep -c "XMRig")
#ARK WALLET
		if [ $ARK -gt '0' ]; then
		ARKI=$(zenity --list --radiolist --title="$helper $versnum: ARK Desktop Wallet" \
		--text="Select your installation method:" \
		--column="Selected" --column="Method" \
		"" ".deb (64-bit)" \
		"" ".tar.gz (32-bit)" \
		"" "Flatpak")
			deb=$(echo $ARKI | grep -c ".deb")
			flat=$(echo $ARKI | grep -c "Flatpak")
			targz=$(echo $ARKI | grep -c ".tar.gz")

			if [ $deb -gt '0' ]; then
			wget https://github.com/ArkEcosystem/desktop-wallet/releases/download/2.9.5/ark-desktop-wallet-linux-amd64-2.9.5.deb
			chmod +x ark-desktop-wallet-linux-amd64-2.9.5.deb
			#dependencies
			sudo apt-get install gconf2 gconf-service libappindicator1 libudev-deb
			#installation
			sudo dpkg -i ark-desktop-wallet-linux-amd64-2.9.5.deb
			elif [ $targz -gt '0' ]; then
			wget https://github.com/ArkEcosystem/desktop-wallet/releases/download/2.9.5/ark-desktop-wallet-linux-x64-2.9.5.tar.gz
			sudo chmod u+x ark-desktop-wallet-linux-x64-2.9.5.tar.gz
			tar xvzf ark-desktop-wallet-linux-x64-2.9.5.tar.gz
			rm ark-desktop-wallet-linux-x64-2.9.5.tar.gz
			cd ./ark-desktop-wallet-linux-x64-2.9.5
			./configure
			make
			sudo make install
			elif [ $flat -gt '0' ]; then
			flatpak install flathub io.ark.Desktop
			fi
		fi

	if [ $ATOMIC -gt '0' ]; then

	zenity --info --title="$helper $versnum: Atomic Installation" \
	--text="Atomic wallet is available for Debian, Fedora and Ubuntu. If you are using Ubuntu and find the .appimage is not working or unstable, use the Debian (.deb) instead. Coversely Debian users should try the .appimage when running into issues" \
	--height=160 --width=260
	atom=$(zenity --list --radiolist \
	--title="$helper $versnum: Installing Atomic Wallet" \
	--text="Please select the version of Atomic Wallet you wish to install." \
	--height=200 --width=200 \
	--column="Selected" --column="Version" --column="Installer Format" \
	""	"Debian" ".deb" \
	""	"Fedora/RedHat" ".rpm" \
	""	"Ubuntu" ".appimage")

	debi=$(echo $atom | grep -c "Debian")
	dora=$(echo $atom | grep -c "Fedora")
	ubun=$(echo $atom | grep -c "Ubuntu")


	if [ $debi -gt '0' ]; then
	wget https://get.atomicwallet.io/download/atomicwallet-2.35.0-176.deb
	sudo dpkg -i atomicwallet-2.35.0-176.deb
	rm atomicwallet-2.35.0-176.deb && \
	zenity --info --title="$helper $vernum" \
	--text="Atomic Wallet (for $atom) was installed" || \
	zenity --info --title="$helper $versnum" \
	--heigt=250 --width=250 \
	--text="Atomic Wallet (for $atom) could not be installed, please check you are using the correct method for your distribution and try again. Hint: Most Ubuntu users can also use the Debian version and vice-versa."
	elif [ $dora -gt '0' ]; then
	wget https://get.atomicwallet.io/download/atomicwallet-2.35.0-176.rpm
	sudo rpm -i atomicwallet-2.35.0-176.rpm
	rm atomicwallet-2.35.0-176.rpm && \
	zenity --info --title="$helper $vernum" \
	--text="Atomic Wallet (for $atom) was installed" || \
	zenity --info --title="$helper $versnum" \
	--heigt=250 --width=250 \
	--text="Atomic Wallet (for $atom) could not be installed, please check you are using the correct method for your distribution and try again."
	elif [ $ubun -gt '0' ]; then
	wget https://get.atomicwallet.io/download/atomicwallet-2.35.0-176.AppImage
	chmod +x atomicwallet-2.35.0-176.AppImage
	./atomicwallet-2.35.0-176.AppImage && \
	zenity --info --title="$helper $vernum" \
	--text="Atomic Wallet (for $atom) was installed" || \
	zenity --info --title="$helper $versnum" \
	--heigt=250 --width=250 \
	--text="Atomic Wallet (for $atom) could not be installed, please check you are using the correct method for your distribution and try again. Hint: Most Ubuntu users can also use the Debian version and vice-versa."
	fi

	fi
#BINANCE DESKTOP
		if [ $NANCE -gt '0' ]; then
		METHOD=$(zenity --list --radiolist  --title="$helper $versnum" \
			--height=155 --width=370 \
			--text="Select your installation method for Binance Desktop" \
			--column="Selected" --column="Method" --column="File Format" --column="Linux Variants" \
					""	"dpkg" ".deb" "Debian/Ubuntu" \
					""	"rpm"	".rpm"	"Red Hat")

				debi=$(echo $METHOD | grep -c "dpkg")
				red=$(echo $METHOD | grep -c "rpm")
			if [ $debi -gt '0' ]; then
			wget https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb
			dpkg -i binance-amd64-linux.deb
			rm binance-amd64-linux.deb
			elif [ $red -gt '0' ]; then
			wget https://ftp.binance.com/electron-desktop/linux/production/binance-x86_64-linux.rpm
			rpm -i binance-x86_64-linux.rpm
			rm binance-x86_64-linux.rpm
			fi && \
			zenity --info --title="$helper $versnum" \
			--text="Binance Desktop was installed from a $METHOD package"

		fi
#BITCOIN CORE
		if [ $BTC -gt '0' ]; then
		BCC=$(zenity --list --radiolist \
		 --height=150 \
		 --title="$helper $versnum: BitCoin Core" \
		--text="How would you like to install BitCoin Core?" \
		--column="Selected" --column="Method" \
		""	"apt" \
		""	"Flatpak")
		apt=$(echo $BCC | grep -c "apt")
		flat=$(echo $BCC | grep -c "Flatpak")

		if [ $apt -gt '0' ]; then
		sudo apt-add-repository ppa:bitcoin/bitcoin
		sudo apt-get update
		sudo apt-get install bitcoin-qt
		elif [ $flat -gt '0' ]; then
		choice=$(zenity --list --radiolist \
		--title="$helper $versnum" \
		--height=150 --width=200 \
		--text="Select access for BitCoin Core flatpak installation" \
		--column="Selected" --column="Access" --column="Description" \
				""		"user"		"Only grants the current user to edit, run or uninstall" \
				""		"system"	"Grants all users access" )
        	flatpak --$choice install flathub org.bitcoincore.bitcoin-qt -y
		fi
		fi

#PEERCOIN
		if [ $PEERCOIN -gt '0' ]; then
		peer=(zenity --list --radiolist \
		--title="PeerCoin"\
		 --text="How would you like to install PeerCoin?"\
	 	--column="Selection" \
		"" "apt" \
		"" ".tar.gz (32-bit)" \
		"" "Flatpak")
			apt=$(echo $peer | grep -c "apt")
			flat=$(echo $peer | grep -c "Flatpak")
			targz=$(echo $peer | grep -c "tar.gz")

			if [ $apt -gt '0' ]; then
			sudo apt-get update
    			sudo apt-get install apt-transport-https
    			sudo sh -c "echo 'deb https://peercoin.github.io/deb-repo/ buster main' >> /etc/apt/sources.list.d/peercoin.list"
    			wget -O - https://peercoin.github.io/deb-repo/peercoin.apt.key | sudo apt-key add -
    			sudo apt-get update
    			sudo apt-get install peercoin-qt
			elif [ $flat -gt '0' ]; then
			choice=$(zenity --list --radiolist \
			--title="$helper $versnum: Installing PeerCoin with Flatpak"
			--text="Please select the user group for access to the PeerCoin application" \
			--column="Selected" --column="User group" \
			""	"system" \
			""	"user")
			flatpak install --$choice flathub net.peercoin.peercoin-qt -y
			elif [ $targz -gt '0' ]; then
			wget https://github.com/peercoin/peercoin/releases/download/v0.11.0ppc/peercoin-0.11.0-x86_64-linux-gnu.tar.gz
        		sudo chmod u+x peercoin-0.11.0-x86_64-linux-gnu.tar.gz
                	tar xvzf peercoin-0.11.0-x86_64-linux-gnu.tar.gz
			rm peercoin-0.11.0-x86_64-linux-gnu.tar.gz
               		cd ./peercoin-0.11.0
                	cd ./bin
                	chmod +x ./peercoin-qt
                	sudo ./peercoin-qt
			fi
		fi


#STORJNODE

	if [ $STORJNODE -gt '0' ]; then
	## ~~as per the official instructions~~

	# ~~ acquire an authentication token ~~
	#ask user if they already have an authentication token
	zenity --question --title="Samz: Building a Storj Node" \
	 --text="Do you have a Storj Authentication Token?"
		# if yes
				if [ $? -eq '0' ]; then
				token=$(zenity --info --title="$helper $versnum" \
				--text="Please paste your verification token in the text box when prompted")
				#make a directory command or text entry dependent on format of oken
				elif [ $? -eq '1' ]; then
				zenity --question --title="$helper $versnum: Authentication Token Required" \
				--text="You will need an authentication token to continue. Would you like to acquire an authentication token?"
					if [ $? -eq '0' ]; then
						zenity --question --title="Samz: Running a node requires a Storj account."£
						--text="Acquiring a token and running a node requires a Storj account. Do you have a Storj account?"
						if [ $? -eq '0' ]; then
						zenity --question --title="When prompted proide your authentication token"
						elif [ $? -eq '1' ]; then
						zenity --info --title="Samz: You will now be directed to the Storj sign-up page on via your web browser" && xdg-open https://eu1.storj.io/signup
						zenity --info --tilte="Samz: When you have completed sign-up, click ok to continue"
						zenity --info="Samz: To acquire a token you must agree to the Storj Storage Node Operators Terms and Conditions." &&
						xdg-open https://www.storj.io/node-operator-terms-conditions
						fi
					fi
				fi

				SAT=$(zenity --entry --title="Samz: Enter Storj Authentication Token" --text="Please enter your storj authentication token")

					curl -L https://github.com/storj/storj/releases/latest/download/identity_linux_amd64.zip -o identity_linux_amd64.zip
					unzip -o identity_linux_amd64.zip
					chmod +x identity
					sudo mv identity /usr/local/bin/identity
				fi
#TASTYWORKS
	if [ $TASTY -gt '0' ]; then
	tasty=$(zenity --list --radiolist --title="$helper $versnum" \
		--text="Please select your installation method from the list below"
	--column="Selected" --column="Installation Method" --column="Distributions"
	""	".deb"		"Debian/Ubuntu" \
	""	".rpm"		"Red Hat")

		debi=$(echo $tasty | grep -c ".deb")
		red=$(echo $tasty | grep -c ".rpm")

		if [ $debi -gt '0' ]; then
		wget -o https://download.tastyworks.com/desktop-1.x.x/1.19.5/tastyworks-1.19.5-1_amd64.deb ./tastyworks-1.19.5-1_amd64.deb
		sudo dpkg -i tastyworks-1.19.5-1_amd64.deb && \
		zenity --info --title="$helper $versnum: TastyWorks" \
		--height=150 --width=200
		--text="TastyWork has been installed from a .deb package" || \
		zenity --info --title="$helper $versnum: TastyWorks" \
		--width=250
		--text="An error occured while installing TastyWorks using the .deb file"
		rm tastyworks-1.19.5-1_amd64.deb
		elif [ $red -gt '0' ]; then
		wget https://download.tastyworks.com/desktop-1.x.x/1.19.5/tastyworks-1.19.5-1.x86_64.rpm
		sudo rpm -i tastyworks-1.19.5-1.x86_64.rpm
		rm tastyworks-1.19.5-1.x86_64.rpm
		fi

	fi
#WASABI
	if [ $WASABI -gt '0' ]; then
	was=$(zenity --list --radiolist \
	 --title="Wasabi" --text="How would you like to install PeerCoin?" \
	--column="Selection" --column="Install method" \
			""	"apt"
			""	"build from source"
			""	"flatpak")
		apt=$(echo $was | grep -c "apt")
		build=$(echo $was | grep -c "build")

			if [ $apt -gt '0' ]; then
			git clone https://github.com/zkSNACKs/WalletWasabi/blob/master/PGP.txt
			gpg --import PGP.txt
			validation=$(gpg --list-keys zKSNACKs | grep -c "6FB3 872B 5D42 292F 5992 0797 8563 4832 8949 861E")
				if [ $validation -gt '0' ]; then
				wget https://github.com/zkSNACKs/WalletWasabi/releases/download/v1.1.13.0/Wasabi-1.1.13.deb
				sudo dpkg -i Wasabi-1.1.13.deb
				elif [ $validation -eq '0' ]; then
				zenity --info --title="$helper $versnum" \
				--text="It appears as if the PGP is not matching, installation of Wasabi Wallet was abandoned for your financial security"
				fi
			elif [ $build -gt '0' ]; then
			#installing .net
			wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
			sudo dpkg -i packages-microsoft-prod.deb
			rm packages-microsoft-prod.deb

			git clone https://github.com/zkSNACKs/WalletWasabi.git
			cd WalletWasabi/WalletWasabi.Fluent.Desktop
			sudo ln -s /usr/local/share/dotnet/dotnet /usr/local/bin/
			dotnet build && \
			zenity --question --title="$helper $vernum" \
			--height=250 --width=300 \
			--text="The process of building wasabi should be complete. Wasabi run is run by enter a specific command 'dotnet run' from the 'WalletWasabi.Fluent.Desktop' directory."
			cd ..
			rm -r WalletWasabi
			elif [ $flatpak -gt '0' ]; then
			flatpak install flathub io.wasabiwallet.WasabiWallet
			fi
	fi

			if [ $XMRIG -gt '0' ]; then
			#latrel retrieves the name of the latest version from the xmrig website
			latrel=$(lynx -dump -nolist https://xmrig.com/download | grep -i "latest xmrig version is" | cut -c 28-33)
			xmrig=$(zenity  --list --radiolist \
			--text="Select your distribution type" \
			--column="Selected" --column="Type" \
					""	"General Linux" \
					""	"Ubuntu")

			linux=$(echo $xmrig | grep -c "General Linux")
			ubuntu=$(echo $xmrig | grep -c "Ubuntu")

				if [ $linux -gt '0' ]; then
					if [ $generic -gt '0' ]; then
					wget https://github.com/xmrig/xmrig/releases/download/v$latrel/xmrig-$latrel-linux-x64.tar.gz
					tar -xfz xmrig-$latrel-linux-x64.tar.gz
					# cd
					elif [ $static -gt '0' ]; then
					wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
					tar -xfz xmrig-6.16.2-linux-static-x64.tar.gz
					# cd
					fi
				elif [ $ubuntu -gt '0' ]; then
					buntu=$(zenity --list --radiolist \
					--title="$helper $versnum" \
					--text="Select your installation method for XMRig" \
					--column="Selected" --column="Method" \
					"" "Build from source" \
					"" "Advanced build" \
					"" "Build from Github (Recommended)" )

					advanced=$( echo $buntu | grep -c "Advanced")
					build=$(echo $buntu | grep -c "Build")
					gitbuild=$(echo $buntu | grep -c "Git")
						if [ $build -gt '0' ]; then
						sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
						git clone https://github.com/xmrig/xmrig.git
						mkdir xmrig/build && cd xmrig/build
						cmake ..
						make -j$(nproc)
				
							cuda=$(zenity --question --title="$helper $versnum" \
								--height=200 --width=300 \
								--text="CUDA plugin build is optional and only required if you like to use NVIDIA GPUs. Would you like to install CUDA plug-in?")
							if [ $? -eq '0' ]; then
							git clone https://github.com/xmrig/xmrig-cuda.git
							mkdir xmrig-cuda/build && cd xmrig-cuda/build
							cmake .. -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
							make -j$(nproc)
							fi
						elif [ $advanced -gt '0' ]; then
						sudo apt-get install git build-essential cmake automake libtool autoconf
						git clone https://github.com/xmrig/xmrig.git
						mkdir xmrig/build && cd xmrig/scripts
						./build_deps.sh && cd ../build
						cmake .. -DXMRIG_DEPS=scripts/deps
						make -j$(nproc)

							cuda=$(zenity --question --title="$helper $versnum" \
							--text="CUDA plugin build is optional and only required if you like to use NVIDIA GPUs. Would you like to install CUDA plug-in?" \
							--height=200 --width=300 )
							if [ $? -eq '0' ]; then
							git clone https://github.com/xmrig/xmrig-cuda.git
							mkdir xmrig-cuda/build && cd xmrig-cuda/build
							cmake .. -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
							make -j$(nproc)
							fi
					
						elif [ $gitbuild -gt '0' ]; then
						git clone https://github.com/xmrig/xmrig.git
						mkdir xmrig/build && cd xmrig/scripts
						./build_deps.sh && cd ../build
						cmake .. -DXMRIG_DEPS=scripts/deps
						make -j$(nproc)
						fi
					fi
			fi
		
#End sequence
	zenity --info --title="$helper $versnum" \
	--height=150 --width=250 \
	--text="$helper $versnum is developed and distributed by The ELCI Group Ltd under a GPL V3. To support the publisher please donate BAT via https://elci.uk or https://github.com/ELCI-Linux"
