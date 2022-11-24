#!/bin/bash -eu
canada=(server1 server2 server3 server4 server5)
sweden=(server1 server2 server3 server4 server5)
switzerland=(server1 server2 server3 server4 server5 server6 server7) 


chooseConnection () {
echo ""
echo "Loading current configured server..."
conf=$(cat wgsconf)
echo "$conf"
echo ""
case $connectionOption in 
    "connect") 
        countrySelect;;
    "disconnect") 
        echo ""
        echo "Disconnecting.."
        sudo wg-quick down $conf
    ;;
    "up") 
        countrySelect;;
    "down")
        echo ""
        echo "Disconnecting.."
        sudo wg-quick down $conf
    ;;
    *)
    echo "Input not accepted. Try up, down, connect, or disconnect."
    startup
esac
}
countrySelect () { 
        echo "Country?"
        read countryIn
        country=$countryIn
        setConf
} 

setConf () {
echo ""
echo "Connecting..."
echo "Choose server 1-5:"
case $country in 
    "canada") 
        read serverSelect
        printf ${canada[$serverSelect]} > wgsconf;; 
    
    "sweden") 
        read serverSelect
        printf ${sweden[$serverSelect]} > wgsconf;; 
        
    "switzerland") 
        read serverSelect
        printf ${switzerland[$serverSelect]} > wgsconf;; 
    *) 
        echo "Did not recognize country. Try again."
        countrySelect;; 
esac
conf=$(cat wgsconf)
connector
}

connector () {
sudo wg-quick up $conf
}

startup () { 
echo "Connect or Disconnect?" 
read connectionOption
chooseConnection
}

echo "Simple Wireguard Selector" 
echo ""
startup
