#!/usr/bin/expect
spawn ssh -l root 192.168.1.47
set timeout -1
expect "root@192.168.1.47's password:"
send "5iveL!fe\r"
expect "*]#"
send "docker-compose -f /srv/framework/docker-compose-serviceframe.yml restart [lindex $argv 0] && exit\r"
expect eof