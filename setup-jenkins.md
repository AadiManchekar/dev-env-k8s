
## Jenkins setup

 1. Create a VM from GCP i used e2-standard-8 (8 vCPU + 32 GB memory, Ubuntu2204 LTS, boot disk 40GB SSD persistent disk). Make sure to add your ssh keys so you can easily ssh into the VM

    sudo apt update
    sudo apt install -y curl
    
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
    
    sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    
    sudo apt update
    sudo apt install openjdk-17-jre-headless
    sudo apt install jenkins -y
    sudo systemctl start jenkins.service
    sudo systemctl status jenkins
    sudo ufw allow 8080
    sudo ufw enable
    sudo ufw status
     sudo cat /var/lib/jenkins/secrets/initialAdminPassword
     go to IP:8080
     Select plugins to install -> unselect Mailer, Email Extension, LDAP, ANT | Select Role-based Authorization Strategy, Github, Parameterized Trigger
     For user type admin in all the fields (username, password, email)



 2. List item

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTg4Mjk4MjI3NCw4MzUxNzQyOTcsMjY4NT
E4MTg2LDYwMjY0Njg5NywtMTg1MjA5OTA5NCwtNDcyNjM1MDMs
MjUxMzc4ODk3XX0=
-->