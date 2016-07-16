#!/bin/bash 
#2013-04-08  
#author myhoop 
#blog [url]http://myhoop.blog.[/url]  
  
#批量ssh认证建立 
  
for p in $(cat ip.txt)  #注意ip.txt文件的绝对路径 
do  
ip=$(echo "$p"|cut -f1 -d":")       #取ip.txt文件中的ip地址 
password=$(echo "$p"|cut -f2 -d":") #取ip.txt文件中的密码 
  
#expect自动交互开始 
expect -c "  
spawn ssh-copy-id -i ~/.ssh/id_rsa.pub root@$ip 
        expect {  
                \"*yes/no*\" {send \"yes\r\"; exp_continue}  
                \"*password*\" {send \"$password\r\"; exp_continue}  
                \"*Password*\" {send \"$password\r\";}  
        }  
"  
done  
  
#通过ssh批量执行命令 
  
for h in $(cat ip.txt|cut -f1 -d":") 
do 
#ssh root@$h '此处写要执行的命令'   
#如果命令是多行的，请参照下面 
scp docker_hosts.sh root@$h:~

#scp install_docker.sh root@$h:~
#ssh root@$h 'sudo sh hostname.sh'
#ssh root@$h '此处写要执行的命令3'
done 
  
  
#ip.txt文件里面ip和密码写法 
#192.168.0.2:admin2 
#192.168.0.3:admin3

#'./id_rsa': No such file
#touch id_rsa
