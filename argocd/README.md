# Install and Configure ArgoCD (Master Machine)

#### Create a Namespace 

```bash
    kubectl create namespace argocd
```

#### Apply argocd manifest

```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

#### Make sure all pods are running in argocd namespace

```bash
     kubectl get pods -n argocd
```

#### Install argocd CLI

```bash
    sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.4.7/argocd-linux-amd64
```

#### Provide executable permission

```bash
    sudo chmod +x /usr/local/bin/argocd
```

#### Check argocd services

```bash
    kubectl get svc -n argocd
```

#### Change argocd server's service from ClusterIP to NodePort

```bash
    kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
```

#### Confirm service is patched or not

```bash
    kubectl get svc -n argocd
```

####  Allow Ports show in above commands in Cluster Node

#### Access in Browser

<public-ip-node>:<port>

#### Fetch Password

```bash
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

#### Enter Credentials

username - admin
paasword - Rahul123@

#### Creating Repo

- Settings -> Repositories -> Create Repo
- Choose HTTP/HTTPS
- URL of git Repo
- Project name default
- username/password 

    
