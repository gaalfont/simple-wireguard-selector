# simple-wireguard-selector
simple bash script I made to be able to easily select between a few different wireguard configs 

usage: put wg.sh and wgsconfig somewhere, ideally ~/ 

open wg.sh, you will see in the top of the file: 
canada=(server1 server2 server3 server4 server5)
sweden=(server1 server2 server3 server4 server5)
switzerland=(server1 server2 server3 server4 server5 server6 server7) 

just add your conf file names there (so if you normally did 
"sudo wg-quick up exampleserver"
to have wireguard load exampleserver.conf, you would replace server1 with exampleserver (and replace canada, sweden, etc with the countries you connect to)

when that's done, just
"sudo bash wg.sh" 
and follow the prompts. 

