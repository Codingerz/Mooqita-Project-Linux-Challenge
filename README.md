# Mooqita-Project-Linux-Challenge
An additional homework assignment for The Linux Foundation Course: LFS101x 

Two bash scripts were created:

1: [mooqitachallenge_turtle.sh]: It's using a loop to write into a file the random data, line by line.

2: [mooqitachallenge_rabbit.sh]: BEST CHOICE! Writes in less than a second.

Notes:

a) Used /dev/urandom to generate random data with "tr" to translate into readable data.

b) Used "fold" command to fold the data into a column with 15 chars length.

c) REMEMBER to SUM the "\n" char of each line.

d) Used the "-o" option instead of "sort file > file" because the first one written a blank file.

e) Used the "sed" with a REGEX '/^[aA].*/d' to remove lines starting with "a" or "A".

Lines removed:

With this command: $ diff rabbitRawOutput rabbitNthOutput | wc -l

2097

With this command: $ diff turtleNthOutput turtleRawOutput | wc -l

2117
