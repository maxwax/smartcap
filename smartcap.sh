#!/bin/bash

# 2019-01-03 maxcode@maxwellspangler.com

# Review and capture S.M.A.R.T. health attributes and other information
# about a storage device

# Output for smartctl -x
TMP_FILE_X="/tmp/capture-smartctlx.$$"

# Output for smartctl -A
TMP_FILE_A="/tmp/capture-smartctla.$$"

OUTDIR=/home/${USERNAME}/smartlogs
if [[ ! -d $OUTDIR ]]
then
  mkdir $OUTDIR
fi

function usage {
  echo
  echo "capture-smartctl <BLOCK-DEVICE>"
  echo
  echo "Ex: capture-smartctl /dev/sdb"
  echo
  echo "Available devices:"
  if [[ $(whereis lsscsi | awk '{print $2}') != "" ]]
  then
    lsscsi
  fi
}

# Remove extra spaces from raw text
function clean_text {
  TEXT=$(echo $1 | sed -e 's/^[ \t]*//' | sed -e 's/[ \t]*//')
  echo $TEXT
}

if [[ $(id -u) != 0 ]]
then
  echo "Error: You must run this program as root or via 'sudo smartcap'"
  exit 1
fi

# Require a block device as a parameter
BLOCK_DEVICE=${1:-"_null"}

if [[ $BLOCK_DEVICE == "_null" ]]
then
  echo "Error: You need to specify a block device to inspect."
  echo
  usage
  exit 1
else

  if [[ ! -b $BLOCK_DEVICE ]]
  then
    echo "Error: Requested device $BLOCK_DEVICE is not a block device"
    usage
    exit 1
  else
    smartctl -x $BLOCK_DEVICE > $TMP_FILE_X
    smartctl -A $BLOCK_DEVICE > $TMP_FILE_A

    # Reported via stdout and used in log file name generation
    FAMILY=$(cat $TMP_FILE_X | egrep '^Model Family:' | awk -F ":" '{print $2}' | sed -e 's/^[ \t]*//' | sed -e 's/[ \t]*//' | sed 's/ /-/g')
    DEVICE=$(cat $TMP_FILE_X | egrep '^Device Model:' | awk -F ":" '{print $2}' | sed -e 's/^[ \t]*//' | sed -e 's/[ \t]*//' | sed 's/ /-/g')
    SERIAL=$(cat $TMP_FILE_X | egrep '^Serial Number:' | awk -F ":" '{print $2}' | sed -e 's/^[ \t]*//' | sed -e 's/[ \t]*//'| sed 's/ /-/g')
    FORM=$(cat $TMP_FILE_X | egrep '^Form Factor:' | awk -F ":" '{print $2}' | sed -e 's/^[ \t]*//' | sed -e 's/[ \t]*//' | sed 's/ /-/g')

    DATE=$(date +"%Y-%m%d")

    # Show important information
    echo
    echo "Drive is $FAMILY, $DEVICE, $SERIAL, $FORM"
    echo
    cat $TMP_FILE_A | egrep "^ID|^  4|^  5"
    echo
    cat $TMP_FILE_A | egrep "^ID|^187|^196|^197|^198"

    OUTFILE="$OUTDIR/$FAMILY.$DEVICE.$SERIAL.$FORM.$DATE"

    cat $TMP_FILE_X > $OUTFILE
    echo >> $OUTFILE
    cat $TMP_FILE_A >> $OUTFILE

    chown $USERNAME $OUTFILE

    rm $TMP_FILE_X $TMP_FILE_A

  fi
fi