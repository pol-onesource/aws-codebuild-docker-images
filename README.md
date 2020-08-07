# AWS CodeBuild curated Docker images

This repository holds Dockerfiles of official AWS CodeBuild curated Docker images. 
Standard image 4 has been modifed to include the following:

- aws-cdk

To build type 'make'
If ECR Repo does not exist create it with
```
aws ecr create-repository --repository-name <Repository Name>
```