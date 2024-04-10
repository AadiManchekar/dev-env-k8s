# dev-env-k8s


The Infra components can be a docker compose file with all necessary MB, DBs, Utility tool (maybe systemd)


References:
1. https://medium.com/devops-technical-notes-and-manuals/how-to-install-docker-on-ubuntu-22-04-b771fe57f3d2
2. https://kodekloud.com/community/t/installing-kubernetes-1-26-with-kubeadm/321687

## Learnings 
- Tried building base images for master and worker nodes using dockerfiles and writing commands such as 
```bash
swapoff -a

O/P: swapoff: Not superuser.
```
disabling swap using swapoff directly within a running Ubuntu 22 Docker container isn't possible. due to Limited Privileges: Docker containers operate in a restricted environment and don't have root access to the host system. This prevents them from modifying system-wide settings like swap configuration.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTM2Nzc2MTI5XX0=
-->