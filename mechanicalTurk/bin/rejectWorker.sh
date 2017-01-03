#!/bin/bash

# Copyright 2016
# Ubiquitous Knowledge Processing (UKP) Lab
# Technische Universität Darmstadt
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script takes an AMT results file and determines how many rejected
# assignments there are for each HIT.  Then it adds a corresponding number
# of assignments for those HITs.

usage() {
    echo "Usage: $0 [ -s ] -r <file.result> -w <workerid> -m <rejectionmessage>"
    echo
    echo "  -s	run against the AMT developer sandbox environment"
    echo "  -r	AMT .result file"
    echo "  -w	ID of the worker whose assignments to reject"
    echo "  -m	the rejection message"
}

resultfile=""
workerid=""
message=""

while getopts ":m:w:r:s" opt; do
    case "$opt" in
	s)
	    sandbox="-sandbox"
	    ;;
	r)
	    resultfile=${OPTARG}
	    ;;
	w)
	    workerid=${OPTARG}
	    ;;
	m)
	    message=${OPTARG}
	    ;;
	*)
	    usage
	    exit 1
	    ;;
    esac
done
shift $((OPTIND-1))

if [ "$resultfile" = "" ]; then
    echo "Missing mandatory option -r"
    usage
    exit 1
fi

if [ "$workerid" = "" ]; then
    echo "Missing mandatory option -w"
    usage
    exit 1
fi

if [ "$message" = "" ]; then
    echo "Missing mandatory option -m"
    usage
    exit 1
fi

if [ ! -r "$resultfile" ]; then
    echo "Can't open $resutfile"
    exit 1
fi

rejectfile="$(mktemp)"
echo -e "assignmentIdToReject\tassignmentIdToRejectComment" > "$rejectfile"
for assignmentid in $(cut -f19,20 "$resultfile" \
			  | fgrep \""$workerid"\" \
			  | cut -f1); do
    echo -e "${assignmentid}\t\"${message}\"" \
	 >> "$rejectfile"
done

./rejectWork.sh "$sandbox" -rejectfile "$rejectfile"

rm "$rejectfile"
