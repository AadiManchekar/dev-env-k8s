
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



 2. List item

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbNjAyNjQ2ODk3LC0xODUyMDk5MDk0LC00Nz
I2MzUwMywyNTEzNzg4OTddfQ==
-->