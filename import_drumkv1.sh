# script to import a drumkit in drumkv1
# version : 1 ... Very basic
# author : arnaudfi
# please fell free to use, improve, re-publish it :)

#! /bin/bash

DOSSIER=`zenity --title="Select a drumkit directory" --file-selection --directory`
LISTE=`ls "$DOSSIER"`
echo $LISTE

pos=`echo $DOSSIER |awk 'BEGIN{FS="/"} {print NF}'`
FILENAME=`echo "$DOSSIER" | cut -d'/' -f $pos-`
echo $FILENAME

FILE=`zenity --title="Write the name of the file without .drumkv1" --file-selection --save --confirm-overwrite --filename="$DOSSIER/$FILENAME"`



echo "<!DOCTYPE drumkv1>" >> "$FILE".drumkv1
echo "<preset name=\"$FILENAME\" version=\"0.9.20\">" >> "$FILE".drumkv1
echo "<elements>" >> "$FILE".drumkv1

# index start from 0
ind=0

for i in $LISTE
do
echo  "<element index=\"$ind\">" >> "$FILE".drumkv1
echo " <sample>"$i"</sample>" >> "$FILE".drumkv1
echo "</element>" >> "$FILE".drumkv1
let ind++;
done

echo  "</elements>" >> "$FILE".drumkv1
echo "</preset>" >> "$FILE".drumkv1



