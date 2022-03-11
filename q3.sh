#!/bin/bash

# question number 3 : making the rm command safe

# ----------------------------------------------------
# ------------ Muhammad Usman Shahid -----------------
# -------------------- 20I-1797 ----------------------
# ------------------------ T -------------------------
# ----------------------------------------------------


# if no or more than one argument giving error
if [ $# == 1 ]
then

    # only is one argument
    
    #creating the desired directory in current folder if not made already
    ls | grep safe_rm_recycle > /dev/null # redirecting the output to hide not to show on terminal if folder exist

    #if the folder found don't made if not then made
    if [ $? != 0 ] # mean previous not executed correctly thus need folder
    then

        # making the folder
        mkdir safe_rm_recycle

    fi

    #checking for the file first did exist or not which is being tried to remove
    find $1 &> /dev/null # redirecting the output and error to hide not to show on terminal if file exist

    if [ $? != 0 ] # mean previous not executed correctly thus no file --- error
    then

        # error message
        echo -e "\n\t :::::::: Error, no such file exist ::::::::";

    else

        # else the file exist

        cp ./$1 ./safe_rm_recycle/$1 # copying the file to the recycle folder

        # now deleting
        rm $1

        echo -e "\n\t :::: successfully deleted $1 file :::: \n\n"
    fi

else

    echo -e "\n\t :::: Wrong Parameters, Enter only file name in parameter to delete :::: \n\n"

fi