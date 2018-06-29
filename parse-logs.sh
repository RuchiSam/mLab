#!/usr/bin/env bash

LOG_FILE_URL='https://s3-us-west-1.amazonaws.com/doug-log-test/logs.txt.gz'

#
# Download the log file that needs to be parsed
#
echo    'Downloading the log file...'
`wget $LOG_FILE_URL`

#
# Untar the log file
#
echo    'Uncompressing...'
`gunzip logs.txt.gz`

#
# Look for the lines that contains the word "error" and count number of such 
# lines.
#
echo -e 'Counting errors...\n'
count=`grep -c "\berror\b" logs.txt`

#
# Remove the untar'ed file
#
`rm -f logs.txt`

echo    '==================================================='
echo    'COUNT OF LINES WITH THE PHRASE "ERROR" IS:' $count
echo -e '===================================================\n'

