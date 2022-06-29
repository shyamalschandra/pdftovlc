#!/bin/bash
export FILE=`ls -Art *.pdf | tail -n 1`
export TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".txt"}'`
export MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".aiff"}'`
export ASCII_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-ascii.txt"}'`
export NODOTS_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-nodots.txt"}'`
export FINISHED_MUSIC_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0".mp3"}'`
export NODOTS_SPLIT_TEXT_FILE=`echo $FILE | cut -d "." -f1| awk '{print $0"-nodots-chapter-"}'`
echo "Convert PDF to text"
pdftotext $FILE $TEXT_FILE
echo "Splitting file into 250K pieces"
split -b 2500 $TEXT_FILE $NODOTS_SPLIT_TEXT_FILE
chapters=($(ls $NODOTS_SPLIT_TEXT_FILE*))
echo "Converting from text to AIFF"
for each in "${chapters[@]}"
do
  export AIFF_FILE=`echo $each | awk '{print $0".wav"}'`
  export MP3_FILE=`echo $each | awk '{print $0".mp3"}'`
  tts --text "`cat $each`" --out_path $AIFF_FILE
  echo "Converting each split file from AIFF to MP3"
  ffmpeg -y -threads 4 -i $AIFF_FILE $MP3_FILE
  sleep 1
  echo "Uploading MP3 to iOS device via VLC mobile app"
  curl --progress-bar --form "file[]=@$MP3_FILE" http://$1/upload.json | tee -a vlc-ios-upload.log; test ${PIPESTATUS[0]}
done
