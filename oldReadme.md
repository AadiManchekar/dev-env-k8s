# test-env-k8s
Large Enterprises use a k8s test environment to do their testing be it on dev level or QA level. 
repo contains basic boilerplate code that will help u get started with Creating your own test-environment for your enterprise :)

## Infra Components
To create an ideal test environment, you must have infra components to be up always. We cannot run them as pods since pods may be rescheduled or they might be stuck in containercreating/ Not Ready state due to a lack of resources. We cannot afford this, hence we must operate some core infra components as Docker containers. You can have them on a dedicated node. Make sure that node has a taint so that no other pods schedule on it. 

Some Core infra components can be:

 1. Kafka/RabbitMQ
 2. Nginx (Serve https/gRPC/wss requests)
 3. Postgresql/Mysql (To store SQL data)
 4. neo4j (GraphDB)
 5. Cassandra/ Scylladb (To store No SQL data)
 6. Redis (Cache)
 7. Spark (if you are processing some data)

## Other Configurations

We need to create instance group so that it can scale up/down the worker nodes. 

**Why arent we using GKE?**
-- I agree GKE provides, automatically updates of Kubernetes control plane, node auto-repair, auto scaling, auto security patches etc.  But the main thing is, many enterprise have their custom base images, they want control over the base infrastructure, choice of Kubernetes versions, networking setups, and node provisioning. managing your own cluster allows you to choose and configure different storage solutions, including network-attached storage (NAS) or distributed file systems. The most important thing is you have more granular control over the costs associated with VM instances, storage, and network resources

 - Ingress is used to expose Services to outside of cluster. it acts as an entry point for your cluster. It lets consolidation of routing rules into a single resource as it can expose multiple services under the same IP address. You can use your custom ingress or something like https://kubernetes.github.io/ingress-nginx/ which is OpenSource :) 
