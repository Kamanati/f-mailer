#!/bin/bash
# Author: @hasanfq6
# https://github.com/kamanati/f-mailer

banner(){
    clear
    echo -e "\e[1;31m"
    if ! [ -x "$(command -v figlet)" ]; then
        echo 'Introducing f-mail'
    else
        figlet  f-mailer 
    fi
    if ! [ -x "$(command -v toilet)" ]; then
        echo -e "\e[4;34m This tool Was Created By \e[1;32mf-mailer \e[0m"
    else
        echo -e "\e[1;34mCreated By \e[1;34m"
        toilet -f mono12  HA_AN
    fi
    echo -e "$black choose $black option"

}

PWD=$(pwd)
source $PWD/.source/doc/var.sh


trap ctrl_c int
function ctrl_c(){
    clear
    banner
    echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
    sleep 3; clear
    exit 1
}



main(){



    clear; banner; sleep 1
    echo -e "$green Server: ${red} > 1$end\n"
    echo -e "$green Server: ${red} > 2$end\n"
    echo -e "$green Server: ${red} > 3$end\n"

    echo -ne "\t$green Wich$red > $end"
    read server

am start -a android.intent.action.VIEW -d https://instagram.com/hasanfq6?igshid=YmMyMTA2M2Y= > /dev/null 2>&1 ;


    case $server in

        1) server=$server1
        ;;

        2) server=$server2
        ;;
        
        3) server=$server3
        ;;

        *)  clear; banner
            echo -e "\n$green[$red$flicker-$end$green] Error: $end You are exiting to this script"
            exit 1
        ;;

    esac

    clear; banner; sleep 0.5

    echo -ne "$green Email Spoofer: $red"
    read fake_email; clear; banner

    echo -ne "$green Target: $red"
    read target; clear; banner

    echo -ne "$green Head (Title): $red"
    read head; clear; banner;

    echo -ne "$green Body: $red"
    read body; clear; banner;


    echo -e "$white The mail will send like: \n $end"
    echo -e "$red > $green Spoofer: $white $fake_email \n $end"
    echo -e "$red > $green Target (email): $white $target \n $end"
    echo -e "$red > $green Head: $white $head \n $end"
    echo -e "$red > $green Body Message: $white $body \n $end"
    sleep 1

    echo -ne "$green Do you want to send this mail? $red[y/n]: "
    read answer

    if [[ $answer == [Yy] ]]; then
        curl --data "destinatario=$target && asunto=$head && mensaje=$body && remitente=$fake_email" $server 2>/tmp/log_faque.txt
        rm /tmp/log_faque.txt
        clear; banner
        echo -e "\n$green[$white+$green]$end Sended."

    elif [[ $answer == [Nn] ]]; then
        clear; banner;
        echo -e "\n$green[$white$flicker*$end$green] Thanks for using this Script <3 $end"
        exit 1

    else
        echo -e "\n$green[$red$flicker-$end$green] Error: $end You are exiting to this script"

    fi

}

main
