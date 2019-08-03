#!/bin/bash
export FILE=`ls -Art *.pdf | tail -n 1`
export TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".txt"}'`
export MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".aiff"}'`
export ASCII_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-ascii.txt"}'`
export NODOTS_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-nodots.txt"}'`
export FINISHED_MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".mp3"}'`
echo "Convert PDF to text"
pdftotext $FILE $TEXT_FILE
echo "Remove Unicode parts"
echo `iconv -c -f utf-8 -t ascii $TEXT_FILE` > $ASCII_TEXT_FILE
echo "Remove Dots"
cat $ASCII_TEXT_FILE | sed 's/\s.//g' > $NODOTS_TEXT_FILE
echo "Converting from text to AIFF"
say --progress -r $1 -o $MUSIC_FILE -f $NODOTS_TEXT_FILE
echo "Converting from AIFF to MP3"
ffmpeg -i $MUSIC_FILE $FINISHED_MUSIC_FILE
echo "Uploading MP3 to iOS device via VLC mobile app"
curl --progress-bar --form "file[]=@$MUSIC_FILE" http://$1/upload.json | tee -a vlc-ios-upload.log; test ${PIPESTATUS[0]}
