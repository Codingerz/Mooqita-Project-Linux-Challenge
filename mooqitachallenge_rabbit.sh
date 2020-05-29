#!/bin/bash

# Config variables
maxFileSize=1048576
uidSize=15
rabbitRawFile=rabbitRawOutput
rabbitNthFile=rabbitNthOutput

# Calc total lines to get in RANDOM (divid total bytes by UID Size plus a line break)
uidLineSize=$(expr $uidSize + 1)
totalLines=$(expr $maxFileSize / $(expr $uidSize + 1) )

# Random UID list generation
# Used /dev/urandom to generate random data
# Used tr to "translate" to readable characters
# Used fold to "fold" contents to "15 Character size"
# Took the first "$totalLines" lines from the result with "head"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $uidSize | head -n $totalLines > $rabbitRawFile

# Sort the file
# Used the "-o" option instead of "sort file > file" because the first one writted a blank file
sort -o $rabbitRawFile $rabbitRawFile

# Filter file deleting lines matching the first char 'A' or 'a' and write to a new Final File
sed -r '/^[aA].*/d' $rabbitRawFile > $rabbitNthFile