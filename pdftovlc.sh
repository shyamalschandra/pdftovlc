#!/bin/bash
export FILE=`ls -Art *.pdf | tail -n 1`
export TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $1".txt"}'`
export MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $1".m4a"}'`
export ASCII_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $1"-ascii.txt"}'`
echo "Convert PDF to text"
pdftotext $FILE $TEXT_FILE
echo "Remove Unicode parts"
echo `iconv -c -f utf-8 -t ascii $TEXT_FILE` >> $ASCII_TEXT_FILE
say --progress -r 300 -o $MUSIC_FILE -f $ASCII_TEXT_FILE
echo "Upload to iPhone via VLC"
curl --progress-bar --form "file[]=@$MUSIC_FILE" http://$2/upload.json | tee -a vlc-ios-upload.log; test ${PIPESTATUS[0]}