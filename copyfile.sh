#!/usr/bin/expect
spawn scp [lindex $argv 0] root@192.168.1.47:[lindex $argv 1]
set timeout -1
expect "root@192.168.1.47's password:"
send "5iveL!fe\r"
expect eof