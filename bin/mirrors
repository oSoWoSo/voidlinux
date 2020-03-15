    #!/bin/bash

    declare -a arr=("alpha.de.repo.voidlinux.org" "alpha.de.repo.voidlinux.org" "alpha.us.repo.voidlinux.org" "mirror.clarkson.edu/voidlinux/" "mirrors.servercentral.com/voidlinux/" "mirror.aarnet.edu.au/pub/voidlinux/" "ftp.swin.edu.au/voidlinux/" "ftp.acc.umu.se/mirror/voidlinux.eu/" "mirrors.dotsrc.org/voidlinux/" "lysator7eknrfl47rlyxvgeamrv7ucefgrrlhk7rouv3sna25asetwid.onion/pub/voidlinux/" "ftp.lysator.liu.se/pub/voidlinux/" "void.webconverger.org" "www.gtlib.gatech.edu/pub/VoidLinux/")

    fping=10000
    frepo=""

    for repo in "${arr[@]}"
    do
       geo=`geoiplookup $repo | head -1 | sed 's/^.*: //'`
       echo "Testing ping for $repo ($geo)"
       ping=`ping -c 4 $repo | tail -1| awk '{print $4}' | cut -d '/' -f 2 | bc -l`
       echo "$repo Average ping: $ping"
       if (( $(bc <<< "$ping<$fping") ))
       then
            frepo=$repo
            fping=$ping
       fi
    done


    geo=`geoiplookup $frepo | head -1 | sed 's/^.*: //'`
    echo "Recommended repo is: $frepo ($geo)"
    echo "Ping: $fping"
