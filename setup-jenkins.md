
## Jenkins setup for 2.440.2

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
           sudo cat /var/lib/jenkins/secrets/initialAdminPassword
           go to IP:8080
           Select plugins to install -> unselect Mailer, Email Extension, LDAP, ANT | Select Role-based Authorization Strategy, Github, Rebuilder, Parameterized Trigger
           For user type admin in all the fields (username, password, email)

> Note: i faced ssh difficulties, if you know what youre doing inorder to properly ssh into it then good, else  these are the changes i did in /etc/ssh/sshd_config

    PubkeyAuthentication yes
    PasswordAuthentication yes


 2. Configure python, pip and virtualenv
```
python --version 

create a symbolic link so if u type python it will take python3 by default 
sudo ln -s /usr/bin/python3 /usr/bin/python


```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY3NDQyNDQxNCwtNDM3MzU1NDkyLC0yMT
MyNjg5NTY3LDIwMjQ2MzQ4ODAsLTI3MzQ1Njg1NywtNjAwMzcx
ODU3LC0zMDY4Nzg5NDMsODM1MTc0Mjk3LDI2ODUxODE4Niw2MD
I2NDY4OTcsLTE4NTIwOTkwOTQsLTQ3MjYzNTAzLDI1MTM3ODg5
N119
-->