class profile::ssh_server {
    package {'openssh-server':
           ensure => present,
    }
    service { 'sshd':
           ensure => 'running',
           enable => 'true',
    }
    ssh_authorized_key { 'root@master.puppet.vm':
           ensure => present,
           user   => 'root',
           type   => 'ssh-rsa',
           key    => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz5uQwPNfDy33HT3VQYqo+0HxsMRQgBddIKoHmIWMh7k3idWRwFkkOXzWG8QbUvXiOrysswckguX3DqWBNY/kyk3bW9mzUumnmJiMBMoZhkbVBbJ4h+ZkM7WcGRUXfFBetwmB9Oq7CQ+1sS70KkG+TIbW2tXaGRrxGi+wQ8G7X8sa2IbligbU2Ju7mt79mv9Z2Vgqm8O19a7Qxk0xfvWDffV1Otthbm7NVoNbjkQKpiYL/oKqeEEA8q1Bc4FxiNxRgDCs8Hk3JLvOHd3MDitrTySHUP1JP5Zw6MhifCGNzCxx94SgG7GT0E6wdJyK/SAzjzKp1VbogYoKQLZhfYxyn',
    }          
}    
