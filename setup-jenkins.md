
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
           # go to IP:8080
           # Select plugins to install -> unselect Mailer, Email Extension, LDAP, ANT | Select Role-based Authorization Strategy, Github, Rebuilder, Parameterized Trigger
           # For user type admin in all the fields (username, password, email)

> Note: i faced ssh difficulties, if you know what youre doing inorder to properly ssh into it then good, else  these are the changes i did in /etc/ssh/sshd_config

    PubkeyAuthentication yes
    PasswordAuthentication yes

but make sure you arent doing this in cloud account of your company :)
if you do then wait for an email from your company's security team XD
turn off PasswordAuthentication and only keep PubkeyAuthentication 

 2. Configure python, pip and virtualenv
```
python --version 

# create a symbolic link so if u type python it will take python3 by default 
sudo ln -s /usr/bin/python3 /usr/bin/python

sudo apt install -y python3-pip

# both pip and pip3 works and point to same version
pip3 --version
pip --version

sudo su
apt install python3-virtualenv
cd /var/lib/jenkins
mkdir virtualenv
cd virtualenv
virtualenv dev-env-k8s-virtualenv
cd dev-env-k8s-virtualenv/
source bin/activate
```

> Remember to activate the vitual env we have to go to (/var/lib/jenkins/virtualenv/dev-env-k8s-virtualenv) and then execute **source bin/activate**

## Configuring job (# dev-env-version-1)

 

    sudo su
    su jenkins
    cd /var/lib/jenkins
    ssh-keygen
    cd .ssh
    cat id_rsa.pub and add this ssh key in you github account
    git clone git@github.com:AadiManchekar/dev-env-k8s.git (type yes)
    # once the repo is clone you can delete it
    rm -rf dev-env-k8s
    
> Now it is added in known_host else if you dont do this you will end up getting this error: Host key verification failed.


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwMzM0NTYxOTUsNjQzOTAyODEzLDE4OD
A4NTEyNTQsMTg4NDE0MTA1NCw0MTY3Njg1MTMsLTQzNzM1NTQ5
MiwtMjEzMjY4OTU2NywyMDI0NjM0ODgwLC0yNzM0NTY4NTcsLT
YwMDM3MTg1NywtMzA2ODc4OTQzLDgzNTE3NDI5NywyNjg1MTgx
ODYsNjAyNjQ2ODk3LC0xODUyMDk5MDk0LC00NzI2MzUwMywyNT
EzNzg4OTddfQ==
-->