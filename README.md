
# Plan A DevOps Challenge 2 - Resolution

This is the resolution of the Plan A challenge 2 located [here](https://github.com/Plan-A-Technologies/DevOps-Challenge-Level-2)



## Requirements

To deploy this environment you will need to have the following:

1. An aws account.
2. An IAM user with administratorAccess permissions or a more refined level of permissions accessing VPC, EC2, EKS. 
3. An awscli installed and configured.
4. Terraform installed.

[install awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[create an IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)

[configure awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

[install terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)


## Deploy Environment


Make sure you create a s3 bucket and update the **main.tf** file with the correct bucket name.

[create a S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html)

Then, change **main.tf** to contain the bucket you created. Line 3.

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

Run the following command on your terminal to set the kubernetes cluster context.

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
