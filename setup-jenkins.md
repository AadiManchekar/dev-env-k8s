
## Jenkins setup

 1. Create a VM from GCP i used e2-standard-8 (8 vCPU + 32 GB memory, Ubuntu2204 LTS, boot disk 40GB SSD persistent disk). Make sure to add your ssh keys so you can easily ssh into the VM

    sudo apt update
    sudo apt install -y curl
    
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
    
    sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    
    sudo apt update
    sudo apt install jenkins -y


 2. List item

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4NTIwOTkwOTQsLTQ3MjYzNTAzLDI1MT
M3ODg5N119
-->