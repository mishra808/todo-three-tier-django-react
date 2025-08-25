## Create EKS Cluster

```bash
#!/bin/bash
eksctl create cluster --name=todo-app-cluster0090 \
                    --region=us-west-2 \
                    --version=1.30 \
                    --without-nodegroup
```

## Associate IAM OIDC Provider

```bash
eksctl utils associate-iam-oidc-provider \
  --region us-west-2 \
  --cluster todo-app-cluster0090 \
  --approve
```

## Creating Key in EC2 with Name eks-nodegroup-key

## Create Nodegroup

```bash
eksctl create nodegroup --cluster=todo-app-cluster0090 \
                     --region=us-west-2 \
                     --name=todo-app-cluster0090-nodes \
                     --node-type=t2.large \
                     --nodes=2 \
                     --nodes-min=2 \
                     --nodes-max=2 \
                     --node-volume-size=29 \
                     --ssh-access \
                     --ssh-public-key=eks-nodegroup-key 

```