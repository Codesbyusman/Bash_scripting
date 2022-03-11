#!/bin/bash

# question number 4 : drawing pattern on specied parameters

# ----------------------------------------------------
# ------------ Muhammad Usman Shahid -----------------
# -------------------- 20I-1797 ----------------------
# ------------------------ T -------------------------
# ----------------------------------------------------

# making functions for the three cases to handdle easily and to increase readibility


# for printing space
printSpace()
{
        # -------------------------------
        # --------- spaces --------------
        # -------------------------------

        #the first parameter is the size by user and second one is the current row in case of straight

        # allocating value
        local j=$1 # as decremental
       

        # while i doesn't reach to the specified limit of the row the i
        while [ $j -gt $2 ] # till row number not comed
        do

            echo -n " " # print the space
            ((j--)) # decrement j

        done # loop ends

}

# for printing stars
printStars()
{
        # -------------------------------
        # --------- stars --------------
        # -------------------------------

        # giving the $1 that wil tell how to print other than 0 mean inverted
        local j=$1 # the local
        
        # while i doesn't reach to the specified limit of the row the i
        while [ $j -lt $2 ] 
        do

            echo -n "*" # print the star
            ((j++)) # increment j

        done
}

# -------- for printing the left --------------
printLeft()
{
   
    # making the local variables for the loops
    local i=0 # for the outer loop
    local j=0 # for the nested inner loop

    # while i doesn't reach to the specified limit the first argument $1
    while [ $i -lt $1 ]
    do

    printStars  0 $i # to make the staright triangle that's why first 0 and second is current row

    ((i++)) #increment i
    echo # giving a type of endl

    done # loop end

}

# -------- for printing the right --------------
printRight()
{
   
    # making the local variables for the loops
    local i=0 # for the outer loop
    local j=0 # for the nested inner loop

    # while i doesn't reach to the specified limit the first argument $1
    while [ $i -lt $1 ]
    do

      

        printSpace $1 $i # function to print spaces first is the size and second is the row
        printStars  0 $i # to make the staright triangle that's why first 0 and second is current row
    

    ((i++)) #increment i

    echo # giving a type of endl

    done # loop end

}

printFull_inverted()
{

    # making the local variables for the loops
    local i=1 # for the outer loop
    local j=1 # for the nested inner loop

    # while i doesn't reach to the specified limit the first argument $1
    while [ $i -lt $1 ]
    do

      
        printStars $i $1 # to make the inverted drawing till the size 
        printSpace $i  0 # function to print spaces first is row second is 0 decremental space
        printSpace $i  0 # function to print spaces first is row second is 0 decremental space ---- two half triangles to make full like
        printStars $i $1 # to make the inverted drawing till the size 
    

    ((i++)) #increment i

    echo # giving a type of endl

    done # loop end

}


# ------------------------------------------------------------
# -------------- Main function implementation ----------------
# ------------------------------------------------------------

if [ $# != 0 ] # if no parameter passed then
then

    # if left
    if [ $1 == left ]
    then
        echo -e " \n ::::::::   Left :::::::: \n "    
        printLeft $2

    elif [ $1 == right ] # if right
    then 
        echo -e " \n :::::::: Right :::::::: \n "
        printRight $2 

    elif [ $1 == inverted_full ] # if full
    then 
        echo -e " \n :::::::: Inverted_Full :::::::: \n "
        printFull_inverted $2

    else # if invalid

        echo -e "\n\n\t   Wrong parameters try only these key words \n"
        echo -e " \t\t       ::::: left ::::::"
        echo -e " \t\t       :::: right ::::::"
        echo -e " \t\t       : inverted_full : \n\n"

    fi # if ended

else

        echo -e "\n\n\t   Please Speify the parameters, only these key words  \n"
        echo -e " \t\t       ::::: left ::::::"
        echo -e " \t\t       :::: right ::::::"
        echo -e " \t\t       : inverted_full : \n\n"

fi