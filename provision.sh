#/bin/bash


create_user()
{
    cd ~
    if [[ -f user_${DEV_USER}_created ]]; then 
        echo " [ok] User \"$DEV_USER\" already created"
        return
    fi 

    echo " [+] Creating user $DEV_USER with password $DEV_USER..."
    adduser --quiet --disabled-password --shell /bin/bash --home /home/$DEV_USER --gecos "$DEV_USER" $DEV_USER
    echo "$DEV_USER:$DEV_USER" | chpasswd
    usermod -aG sudo $DEV_USER
    cp /etc/skel/.bashrc /home/$DEV_USER
    chown -R $DEV_USER:$DEV_USER /home/$DEV_USER/.bashrc

    cd ~
    touch user_${DEV_USER}_created
}


source user_info
create_user

