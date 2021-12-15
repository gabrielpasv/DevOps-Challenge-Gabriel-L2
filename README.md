
# Plan A DevOps Challenge 2 - Resolution

## Requirements

To deploy this environment you need to have an AWS account and be able to access it via aws cli.
Terraform also should be installed on your system.

Make sure you create a s3 bucket and update the **main.tf** file with the correct bucket name.

## Deploy Environment

Clone this repository and navigate to its folder.

Run ```terraform init``` to initialize terraform and download the modules.

Run ```terraform plan``` and make sure there's no error

Run ```terraform apply -auto-approve``` to start the deployment.

If everything is ok, after several minutes you should see something like this

```
Apply complete! Resources: 46 added, 0 changed, 0 destroyed.

Outputs:

cluster_endpoint = "https://37B239B4F905F435D44946EE524EE333.gr7.us-east-1.eks.amazonaws.com"
private_subnets = [
  "subnet-0530567169cae95d2",
  "subnet-07c73a96af9f855cb",
]
public_subnets = [
  "subnet-040c80a83b031596c",
  "subnet-0fe08a590f87db9a7",
]
vpc_id = "vpc-0102e3ec2f98c1fbd"
```



## Login to the cluster to test
```
aws eks update-kubeconfig --name <cluster-name>
```

Deploy a nginx pod to make sure it's working. Make sure you have **kubectl** installed.
```
gabriel@gabriel-Inspiron:~/challenges/DevOps-Challenge-Gabriel-L2$ kubectl run nginx --image=nginx --restart=Never
pod/nginx created
gabriel@gabriel-Inspiron:~/challenges/DevOps-Challenge-Gabriel-L2$
gabriel@gabriel-Inspiron:~/challenges/DevOps-Challenge-Gabriel-L2$ kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          6s
gabriel@gabriel-Inspiron:~/challenges/DevOps-Challenge-Gabriel-L2$

```
