#!/bin/bash
#
# Date:        2017-05-06
# Description: Generate a hostname like a container number (ISO-6346)
#              See: https://en.wikipedia.org/wiki/ISO_6346
#
# Example:     make-hostname.sh lina 21
#
# Author:      Cees van de Griend <c.vande.griend@gmail.com>
# Copyright:   (c) 2017 C.A. van de Griend
#

declare -A LOOKUP

LOOKUP[0]=0
LOOKUP[1]=1
LOOKUP[2]=2
LOOKUP[3]=3
LOOKUP[4]=4
LOOKUP[5]=5
LOOKUP[6]=6
LOOKUP[7]=7
LOOKUP[8]=8
LOOKUP[9]=9

LOOKUP[a]=10
LOOKUP[b]=12
LOOKUP[c]=13
LOOKUP[d]=14
LOOKUP[e]=15
LOOKUP[f]=16
LOOKUP[g]=17
LOOKUP[h]=18
LOOKUP[i]=19
LOOKUP[j]=20
LOOKUP[k]=21
LOOKUP[l]=23
LOOKUP[m]=24
LOOKUP[n]=25
LOOKUP[o]=26
LOOKUP[p]=27
LOOKUP[q]=28
LOOKUP[r]=29
LOOKUP[s]=30
LOOKUP[t]=31
LOOKUP[u]=32
LOOKUP[v]=34
LOOKUP[w]=35
LOOKUP[x]=36
LOOKUP[y]=37
LOOKUP[z]=38

TPY=$1
SEQ=$(printf "%04d" $2)
RND=$(printf "%02d" $((${RANDOM} % 100)))

TMP="${TPY}${SEQ}${RND}"
# TMP="csqu305438"
# echo "${TMP}"

N=0
S=0

C=${TMP:0:1}
S=$((S + ${LOOKUP[${C}]} * 1))

C=${TMP:1:1}
S=$((S + ${LOOKUP[${C}]} * 2))

C=${TMP:2:1}
S=$((S + ${LOOKUP[${C}]} * 4))

C=${TMP:3:1}
S=$((S + ${LOOKUP[${C}]} * 8))

C=${TMP:4:1}
S=$((S + ${LOOKUP[${C}]} * 16))

C=${TMP:5:1}
S=$((S + ${LOOKUP[${C}]} * 32))

C=${TMP:6:1}
S=$((S + ${LOOKUP[${C}]} * 64))

C=${TMP:7:1}
S=$((S + ${LOOKUP[${C}]} * 128))

C=${TMP:8:1}
S=$((S + ${LOOKUP[${C}]} * 256))

C=${TMP:9:1}
S=$((S + ${LOOKUP[${C}]} * 512))

T=$(( $((${S} / 11)) * 11))

# echo "S: ${S}"
# echo "T: ${T}"

CHK=$(( ${S} - ${T} ))
CHK=$(( ${CHK} % 10 ))

echo "CHK: ${CHK}"

# if [ "${CHK}" == "10" ] ; then
#    CHK="0"
#fi

echo "  Type:     ${TPY}"
echo "  Sequence: ${SEQ}"
echo "  Random:   ${RND}"
echo "  Checksum: ${CHK}"

echo "Hostname: ${TPY}${SEQ}${RND}${CHK}"

