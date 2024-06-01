# Docker proxy (registry cache)

## Why we need it?

 - Docker has pull limits also if you are using cloud for creating your k8s cluster using vms or ec2 instances then everything that comes into the cloud costs you. 
 - So instead its better to have a registry cache (docker proxy) setup in same VPC or different but in cloud network only so if once the image is pulled its stored in the registry cache and next time you pull the image it fetches from docker proxy instead of docker.

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU4OTAwMDI5MCw5NTM0MzU3NDMsNzMwOT
k4MTE2XX0=
-->