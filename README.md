# Intro

For this exercise, base infrastructure with the related dependencies will be achieved by using terraform, where the following resources will be created:

- Infrastructure
    - network
    - subnets
    - network security group along with related subnet associations
    - azure Kubernetes Services (basic install for training purposes)
        - pools
            - system pool
            - user pool


# Pre Setup and Provisioning

In order to proceed with the infrastructure provisioning, please follow the following steps:

## Infrastructure automation

On Azure, configure new service principal for terraform cloud

```
az ad sp create-for-rbac --name terraform --role Contributor
```

Proceed to create a new Workspace on your terraform cloud account and select "API-driven workflow". Next, add the following keys as Environment Variables with their respective values from the service principal previously created:

- ARM_CLIENT_ID
- ARM_CLIENT_SECRET
- ARM_SUBSCRIPTION_ID
- ARM_TENANT_ID

On your forked project, make sure to configure the action secret and register `TF_API_TOKEN` with the credentials created from terraform cloud, under "settings" > "tokens"


## Running locally

If you plan to run it locally just make sure that you have at least:
- Azure subscription
- helm3
- Terraform
- Azure client installed

Important: For ubuntu/debian based OS, just run the `local_setup.sh` script under local folder.

