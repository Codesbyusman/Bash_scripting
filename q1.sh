#!/bin/bash

# question number : 1 taking 3 inputs and decding result

# ----------------------------------------------------
# ------------ Muhammad Usman Shahid -----------------
# -------------------- 20I-1797 ----------------------
# ------------------------ T -------------------------
# ----------------------------------------------------

#making the 3 variables
var1=0
var2=0
var3=0

#taking inputs in 3 variables
#whwre echo prints message read reads the input and -n is for formatting
echo -n "Enter the number 1 : "
read var1

echo -n "Enter the number 2 : "
read var2

echo -n "Enter the number 3 : "
read var3

#if contains the most right digits same then print true else false
#taking mod with 10 as this will result in the right most digit

if [ $(($var1%10)) -eq $(($var2%10)) ] || [ $(($var2%10)) == $(($var3%10)) ] || [ $(($var3%10)) == $(($var1%10)) ] #checking if three are equal/same
then 

    #if satisfies then
    echo "The result is : True "

else

    #if not satisfies then
    echo "The result is : False "

fi #ending the if 