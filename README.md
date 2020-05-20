# Jenkins Docker container deployed by Terraform 12 with all the Jobs/Pipelines
Prerequisites:
- Installed Docker
- Installed Terraform 12

Create Docker image
```
docker build -t jenkins:terraform12 .
```

Create Docker container by means of Terraform 12
```
terraform plan
terraform apply
```


