#!/bin/bash

# question number : 2 doing mustiple sub tasks

# ----------------------------------------------------
# ------------ Muhammad Usman Shahid -----------------
# -------------------- 20I-1797 ----------------------
# ------------------------ T -------------------------
# ----------------------------------------------------


#making the menu to proceed the subtasks as 
#for this we will be using the select mechanism it will make a menu and will take the option from user
#entering the data that should be displayed with codes in menu as
menuOptions="permissionManager stringSearch copyofNlines modifiedDate Quit"

# PS3 for holding the message of menu displaying
PS3="Plaese enter the apprppriate option : "

#for menu checking
check=1

while [ $check != 0 ];
do

   #menu ption will contain the selected word and menuoptions contain the list mentioned above
   select menuOption in $menuOptions
   do
      
      #now using the case so to deal the each case
      case $menuOption in 
         permissionManager)
            #for permissions to the file

            #taking the file name
            echo -e -n "\n\t\t Enter file name : " 
            read filename
            echo

            #checking whether the input was right or not
            find $filename &> /dev/null #to not show the error on terminal

            if [ $? != 0 ]
            then
               echo -e " \n\t\t ---- Wrong file name --- \n"
               continue #if wrong then continuing
            fi
            
            echo -n -e "\n\t The file $filename has permissions as : "
            #now displaying the permissions of a file
            ls -l $filename | cut -f1 -d' ' #such that listing and cutting when first space encountered because then other details

            echo 

            #---------- Users Permission ----------

            #if have read options
            if [ -r $filename ]
            then
               #changing the read permission
               chmod u-r $filename
            else
               #giving the read permission
               chmod u+r $filename
            fi

            #if have write options
            if [ -w $filename ]
            then
               #changing the write permission
               chmod u-w $filename
            else
               #giving the write permission
               chmod u+w $filename
            fi

            #if have execute options
            if [ -x $filename ]
            then
               #changing the execute permission
               chmod u-x $filename
            else
               #giving the execute permission
               chmod u+x $filename
            fi

            #---------- groups Permission ----------

            #using cut command and cutting the permissions of groups from the strin as and saving in variable
            grp=$(ls -l $filename | cut -c 5-7) #cutting the permissions of grp

            #making three more variables to store read write and execute
            r=$(echo $grp | cut -c 1) #storing the read    status
            w=$(echo $grp | cut -c 2) #storing the write   status
            x=$(echo $grp | cut -c 3) #storing the execute status
            
            #if have read options
            if [ $r == 'r' ]
            then
               #changing the read permission
               chmod g-r $filename
            else
               #giving the read permission
               chmod g+r $filename
            fi

            #if have write options
            if [ $w == 'w' ]
            then
               #changing the write permission
               chmod g-w $filename
            else
               #giving the write permission
               chmod g+w $filename
            fi

            #if have execute options
            if [ $x == 'x' ]
            then
               #changing the execute permission
               chmod g-x $filename
            else
               #giving the execute permission
               chmod g+x $filename
            fi


            #---------- others Permission ----------

             
            #using cut command and cutting the permissions of others from the string as and saving in variable
            grp=$(ls -l $filename | cut -c 8-10) #cutting the permissions of other

            #updating three  variables to store read write and execute
            r=$(echo $grp | cut -c 1) #storing the read    status
            w=$(echo $grp | cut -c 2) #storing the write   status
            x=$(echo $grp | cut -c 3) #storing the execute status
            
            #if have read options
            if [ $r == 'r' ]
            then
               #changing the read permission
               chmod o-r $filename
            else
               #giving the read permission
               chmod o+r $filename
            fi

            #if have write options
            if [ $w == 'w' ]
            then
               #changing the write permission
               chmod o-w $filename
            else
               #giving the write permission
               chmod o+w $filename
            fi

            #if have execute options
            if [ $x == 'x' ]
            then
               #changing the execute permission
               chmod o-x $filename
            else
               #giving the execute permission
               chmod o+x $filename
            fi


            # ----------------------------------------

            echo -n -e "\n     The file $filename has updated permissions as : "
            #now displaying the permissions of a file
            ls -l $filename | cut -f1 -d' ' #such that listing and cutting when first space encountered because then other details
           
            echo -e "\n\t ------------------------------------------------------ \n "

            echo

            break
         ;;
         stringSearch)
            #for searching the string 

            #taking the file name
            echo -e -n "\n\t\t Enter file name : " 
            read filename
            echo

            #checking whether the input was right or not
            find $filename &> /dev/null #to not show the error on terminal

            if [ $? != 0 ]
            then
               echo -e " \n\t\t ---- Wrong file name --- \n"
               continue #if wrong then continuing
            fi

            #taking the string to find
            echo -e -n "\n\t    Enter the string to search : "
            read stringTofind
            echo 

            #for finding the string using the grep to show line number than usig the n
            grep -n $stringTofind $filename

            #if not found
            if [ $? == 1 ]
            then 
               echo -e " \n\t ------------ No Matches Found ------------ \n"
            fi

            echo

            break #all done
         ;;
         copyofNlines)
            #for copying cntent of files
            # making the dummy.txt if already will overwride that
            touch dummy.txt 
            
            echo > dummy.txt #for clearing already data

            # asking for the n number of lines
            echo -n -e "\n Enter the N lines to be copied from files in the current directory : "
            read N
            echo

            allFiles=$(ls -f *.*) # storing the all files having any name with any extension this will not include directories
            
            i=0
            # for loop accessing the all files
            for files in $allFiles
            do 

               #first the only at even locations accessing the first n lines and copying
               if (($i % 2 == 0)) 
               then
                  
                  # the one which is on even location we are going to print it's first n lines to the dummy.txt
                  head -$N $files >> dummy.txt

               fi

               ((i++)) # to check even and odd
            done
            
            i=0
            #at odd position
            # for loop accessing the all files
            for files in $allFiles
            do 

               #first the only at even locations accessing the first n lines and copying
               if (($i % 2 != 0)) 
               then
                  
                  # the one which is on odd location we are going to print it's last n lines to the dummy.txt
                  tail -$N $files >> dummy.txt

               fi

               ((i++)) # to check even and odd
            done

            

            echo

            break # all done
         ;;
         modifiedDate)
            #for modified date

            touch logFile.txt # for log file 

            #taking the file name
            echo -e -n "\n\t Enter file name : " 
            read filename
            echo

            #appending all to file as maintaining the log
            echo -e -n "\n\t Enter file name : " >> logFile.txt
            echo $filename >> logFile.txt

            #checking whether the input was right or not
            find $filename &> /dev/null #to not show the error on terminal

            #log file 
            find $filename &> /dev/null >> logFile.txt

            if [ $? != 0 ]
            then
               echo -e " \n\t ---- Wrong file name --- \n"
               echo -e " \n\t ---- Wrong file name --- \n" >> logFile.txt
               continue #if wrong then continuing
            fi

            
            #else performing the operation
            echo -e -n "   The last modified time of $filename is : "
            date --reference=$filename
            echo

            # log file
            echo -e -n "   The last modified time of $filename is : " >> logFile.txt
            date --reference=$filename >> logFile.txt
            echo >> logFile.txt

            #storing the credentials of last modified
            #the date also displays but was in the letters as month thats why used stat for a file
            lastModified=$(stat -c '%y' $filename | cut -c 1-11) #taking the current in numbers
            #checking for the today's date also
            current=$(date +%F) #taking the current in numbers

            # log file
            echo current $current >> logFile.txt

            # will cut the day month and year from the above taken date as they are needed
            d=$(echo $lastModified | cut -c 9-10 ) # cutting the day
            m=$(echo $lastModified | cut -c 6-7  ) # cutting the month
            y=$(echo $lastModified | cut -c 1-4  ) # cutting the year

            #also breaking the current
            dc=$(echo $current | cut -c 9-10 ) # cutting the day
            mc=$(echo $current | cut -c 6-7  ) # cutting the month
            yc=$(echo $current | cut -c 1-4  ) # cutting the year

            # now checking for the thing the file is 24 hour back or not
            # if the current year is greater then
            if [ $yc -gt $y ]
               then
      
                  # the current year is greater mean the file too old
                  # modifying it 

                  #giving permissions to the all users to write to avoid error
                  chmod ugo+rw $filename

                  echo -n " " >> $filename # writing to modify -- the only space
                  
                  # printing the new date
                  echo -e -n "        The modified time of $filename is : "
                  date --reference=$filename
                  echo

                  #making the log file also printing the all output to a file
                  
                  echo -e -n "        The modified time of $filename is : " >> logFile.txt
                  date --reference=$filename  >> logFile.txt
                  echo  >> logFile.txt
               
               elif [ $mc -gt $m ] && [ $yc -eq $y ]
               then
                  
                  # the current year current month but day is changed
                  # modifying it 

                  #giving permissions to the all users to write to avoid error
                  chmod ugo+rw $filename

                  echo -n " " >> $filename # writing to modify -- the only space
                  
                  # printing the new date
                  echo -e -n "        The modified time of $filename is : "
                  date --reference=$filename
                  echo

                   #making the log file also printing the all output to a file
                  echo -e -n "        The modified time of $filename is : " >> logFile.txt
                  date --reference=$filename  >> logFile.txt
                  echo  >> logFile.txt

               elif [ $dc -gt $d ] && [ $mc -eq $m ] && [ $yc -eq $y ]
               then

                  # the current year current month but day is changed
                  # modifying it 

                  #giving permissions to the all users to write to avoid error
                  chmod ugo+rw $filename

                  echo -n " " >> $filename # writing to modify -- the only space
                  
                  # printing the new date
                  echo -e -n "        The modified time of $filename is : "
                  date --reference=$filename
                  echo

                  #making the log file also printing the all output to a file
                  echo -e -n "        The modified time of $filename is : " >> logFile.txt
                  date --reference=$filename  >> logFile.txt
                  echo  >> logFile.txt
                  
               else 

                  echo -e "\n\t\t ------- Not 24 hours Old ---------- \n\n"

                  # log file 
                  echo -e "\n\t\t ------- Not 24 hours Old ---------- \n\n" >> logFile.txt
                  echo -e "\n\t\t ------------------------------------------- \n\n" >> logFile.txt
            fi

            echo

            break # all done 
         ;;
         Quit)
            #exiting

            echo -e "\n\t\t ------- BYE ---------- \n"
            check=0 #to exit
            
            break
         ;;
         *) #the default case
            echo -e "\n\t\t Please chose the right option \n"
         ;;
      esac

   done #finished

done #the while