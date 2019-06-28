#!/bin/sh
function samba_add
{
    (echo "$pass"; echo "$pass") | smbpasswd -s -a $user
}

user=smbuser1
pass=smbpass
samba_add

user=smbuser2
pass=smbpass
samba_add

user=smbuser3
pass=smbpass
samba_add

user=smbadmin
pass=smbpass
samba_add

user=guest
pass=guest
samba_add
