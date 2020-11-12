# PDF2VLC for iOS devices with VLC installed
## Version 0.2c (for macOS 10.14 Mojave)
### by Shyamal Suhana Chandra, shyamalc@gmail.com

-----------

**Purpose:** This bash script for MacOS is used to convert the most latest created PDF in the same directory into multiple MP3's by uploading onto an iOS device running VLC in the foreground or background.

-----------

**Prerequisites:** 

1. Please do a `brew install pkg-config poppler`.
2. Please do a `sudo pip install --user pdftotext` before running this script.
3. Please do a `brew install ffmpeg`.

Also, do a `chmod +x pdftovlc.sh` before running.

**Example argument list with the command:**

`./pdftovlc.sh <IP-ADDRESS-OF-VLC-SERVER (e.g. 192.168.1.1)> <Words per minute (e.g. 200)> <Voice Name on MacOS (e.g. Samantha)>`

-----------


