# PDF2VLC for iOS devices with VLC installed
## Version 0.3 (for macOS 11.5.2 Big Sur)
### by Shyamal Suhana Chandra, shyamalc@gmail.com

-----------

**Purpose:** This bash script for MacOS is used to convert the most latest created PDF in the same directory into multiple MP3's by uploading onto an iOS device running VLC in the foreground or background.

-----------

**Prerequisites:** 

1. Please do a `brew install pkg-config poppler`.
2. Please do a `sudo pip install --user pdftotext`.
3. Please do a `brew install ffmpeg`.
4. Please do a `sudo pip install --user numpy`.
5. Run the following commands in this [comment](https://github.com/mozilla/TTS/issues/726#issuecomment-913570903).
6. Please do a `sudo pip install --user TTS`.
4. Please install VLC for [iOS/iPadOS](https://apps.apple.com/us/app/vlc-for-mobile/id650377962).
5. Once VLC is installed, go to the Network, fourth in the bottom pane, and turn on 'Sharing via WiFI' and note the IP Address.
6. Make sure your Mac CPU is Wifi enabled.

Also, do a `chmod +x pdftovlc.sh` when you get into the 'pdftovlc' folder before running.

**Example argument list with the command:**

`./pdftovlc.sh <IP-ADDRESS-OF-IPHONE (Noted Above e.g. 192.168.1.1)>` inside the directory where the latest PDF will be converted into a bunch of MP3s.

-----------


