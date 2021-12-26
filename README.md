# Samz
Samz is a simple bash script that allows users to install a range of finance applications for Linux - via a Graphical User Interface. 
Designed primarily for Debian based systems (with some Red Hat support), Samz takes the hassle out of installing finance applications using bash-script automation. Users simply choose the software they would like and the method of installing the software and Samz does the rest.

Finance Applications included in Samz:
- ARK Desktop Wallet [.deb (for 64-bit),.tar.gz (for 32-bit), Flatpak]
- Binance Desktop Client [.deb (64-bit), .rpm (for RedHat)]
- BitCoin Core [apt (for Debian/Ubuntu), Flatpak]
- PeerCoin [apt, Flatpak, .tar.gz (for 32-bit)]
- Storj Node [Build from source]
- TastyWorks {Fiat} [.deb (for 64-bit Debian/Ubuntu, .rpm (for RedHat)]
Wasabi Wallet [apt (for Debian/Ubuntu), using dotnet]

Dependencies:
apt, curl, dotnet, flatpak, tar, zenity 

To launch Samz, simply enter the command below into your terminal:
    
    git clone https://github.com/ELCI-Linux/Samz ; bash ./Samz/Samz.sh



You will then be promptedhe list of supported programs?
22
 to selec the software you want to install.


 
For software with multiple installation methods, you will be prompted with a radiolist asking you to choose the method you would like.
![Screenshot from 2021-12-26 10-45-11](https://user-images.githubusercontent.com/88078492/147405827-f2d96d02-b8e6-4e33-9847-3ddf1ec0fb3d.png)


Are there any applications that you would like to see included in Samz? Fork this project and submit a pull request to add your favourite GUI'd finance applications to the list of supported programs?

**Messages for the Community**

-

  ARCH USERS (We Need You!):
  We understand that the arch community is huge and massively important part of the modern Linux community, and we would like to include Arch support for           future versions of Samz. 

Samz is currently being developed and maintained by a single individual, however we are open to credited collaboration with any other Linux users within the space. 
