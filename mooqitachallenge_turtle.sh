#!/bin/bash

# Config variables
maxFileSize=1048576
uidSize=15
turtleRawFile=turtleRawOutput
turtleNthFile=turtleNthOutput

# Random UID grneration function
function getRandomUID() {
	# Used /dev/urandom to generate random data
	# Used tr to "translate" to readable characters
	# Used fold to "fold" contents to "15 Character size"
	# Took the first line from the result with "head"
	echo $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $uidSize | head -n 1)
}

# Actual file size reading function
function getFileSize() {
	# Used du command to get file size with "-b" parameter to get the result in "Bytes"
	# Cuted the contents to the first column
	echo $(du -b $turtleRawFile | cut -f1)
}

# Output files resetting
> $turtleRawFile
> $turtleNthFile

# Run a loop until filesize is greater or equal to the 1MiB
until [ $(getFileSize) -ge $maxFileSize ]
do
	echo $(getRandomUID) >> $turtleRawFile
done

# Sort the file
# Used the "-o" option instead of "sort file > file" because the first one writted a blank file
sort -o $turtleRawFile $turtleRawFile

# Filter file deleting lines matching the first char 'A' or 'a' and write to a new Final File
sed -r '/^[aA].*/d' $turtleRawFile > $turtleNthFile