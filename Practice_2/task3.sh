#!/bin/bash
echo -n "Enter day: "
read day

echo -n "Enter month (1-12): "
read month

echo -n "Enter year: "
read year

# Adjust January and February weird months
if (( month == 1 )); then
    month=13
    ((year--)) #REduction of year by 1
elif (( month == 2 )); then
    month=14
    ((year--)) #Same Here
fi

# Julian day formula
julian=$(( (36525 * year) / 100 \
         + (306001 * (month + 1)) / 10000 \
         + day + 1720981 ))

echo "Julian day = $julian"
