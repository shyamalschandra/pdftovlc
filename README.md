# PDF2VLC for iOS devices with VLC installed
## Version 0.3 (for macOS 14.0 Sonoma)
### by Shyamal Suhana Chandra, shyamalc@gmail.com

-----------

**Purpose:** This bash script for MacOS is used to convert the most latest created PDF in the same directory into multiple MP3's by uploading onto an iOS device running VLC in the foreground or background.

-----------

**Prerequisites:** 

0. First, install [homebrew](https://brew.sh) and [pip](https://pip.pypa.io/en/stable/) on MacOS device.
1. Please do a `brew install pkg-config poppler`.
2. Please do a `sudo pip install --user pdftotext`.
3. Please do a `brew install ffmpeg`.
4. Please do a `sudo pip install --user numpy`.
5. Please install VLC for [iOS/iPadOS](https://apps.apple.com/us/app/vlc-for-mobile/id650377962).
6. Once VLC is installed, go to the Network, fourth in the bottom pane, and turn on 'Sharing via WiFI' and note the IP Address.
7. Make sure your Mac CPU is Wifi enabled.
8. Make sure you go to Systems Settings->Accessibility->Spoken Content->System Voice and download and change to 'Zoe (Premium)'.

Also, do a `chmod +x pdftovlc.sh` when you get into the 'pdftovlc' folder before running.

**Example argument list with the command:**

`./pdftovlc.sh <IP-ADDRESS-OF-IPHONE (Noted Above e.g. 192.168.1.1)>` inside the directory where the latest PDF will be converted into a bunch of MP3s.

-----------


