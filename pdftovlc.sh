#!/bin/bash
export FILE=`ls -Art *.pdf | tail -n 1`
export TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".txt"}'`
export MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".aiff"}'`
export ASCII_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-ascii.txt"}'`
export NODOTS_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-nodots.txt"}'`
export FINISHED_MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".mp3"}'`
export NODOTS_SPLIT_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-nodots-chapter"}'`
echo "Convert PDF to text"
pdftotext $FILE $TEXT_FILE
echo "Remove Unicode parts"
echo `iconv -c -f utf-8 -t ascii $TEXT_FILE` > $ASCII_TEXT_FILE
echo "Remove Dots"
cat $ASCII_TEXT_FILE | sed 's/\s.//g' > $NODOTS_TEXT_FILE
echo "Splitting file into 250K pieces"
split -b 250000 $NODOTS_TEXT_FILE $NODOTS_SPLIT_TEXT_FILE
chapters=($(ls $NODOTS_SPLIT_TEXT_FILE*))
echo "Converting from text to AIFF"
for each in "{chapters[@]}"
do
  export AIFF_FILE=`echo $each | awk '{print $0".aiff"}'`
  export MP3_FILE=`echo $each | awk '{print $0".mp3"}'`
  say --progress -r $1 -v $2 -o $AIFF_FILE -f $each
  echo "Converting each split file from AIFF to MP3"
  ffmpeg -threads 4 -i $AIFF_FILE $MP3_FILE
  echo "Uploading MP3 to iOS device via VLC mobile app"
  curl --progress-bar --form "file[]=@$MP3_FILE" http://$1/upload.json | tee -a vlc-ios-upload.log; test ${PIPESTATUS[0]}
done
