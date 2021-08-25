#!/usr/bin/env bash

school_dir="$HOME/Documents/school/"

subjects=(Math Science English Research Electronics AP Esp Filipino MAPEH)
quarters=(1st 2nd 3rd 4th)

getSubjects(){
    echo -e "Total Subjects (${#subjects[*]})";
    echo "${subjects[*]}" |
        xargs -n 1 |
        sort |
        awk 'NR==1, NR=='"${#subjects[*]}"'{print NR".",$0}';
}

createDir(){
    ### Creating a new folder called school in the school path
    if [ ! -d "$school_dir" ]
    then
        echo " Creating the School folder...";
        mkdir "$school_dir";
    else
        echo " Folder already exists. Skipping..."
    fi

    ### Check if all the quarters are already created.
    for i in ${quarters[*]}; do
        if [ ! -d "$school_dir${i} Quarter" ]
        then
            echo " Creating quarterly directories...";
            mkdir "$school_dir${i} Quarter";
        else
            echo " Folder already exists. Skipping...";
        fi
    done

    ### Check if the subjects are already created.
    for i in ${subjects[*]}; do
        for c in ${quarters[*]}; do
            if [ ! -d "$school_dir${c} Quarter/${i}" ]
            then
                echo " Creating ${i} directories in each quarters...";
                mkdir "$school_dir${c} Quarter/${i}";
            else
                echo " Folder already exists. Skipping...";
            fi
        done
    done
}

createDir | uniq
