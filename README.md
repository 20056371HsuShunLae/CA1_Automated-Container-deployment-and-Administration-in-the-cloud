# CI/CD Pipeline for Automated Docker Build and Deployment to AWS EC2 Using Azure DevOps

This document outlines how Azure DevOps CI/CD Pipeline will automatically build and deploy Docker image on AWS EC2 whenver code is pushed from GitHub.

## Workflow

### Agent Setup on EC2

To use a self-hosted agent, first create an agent pool in Azure DevOps. Then, create a new agent within that pool. The EC2 instance must download the configuration file and run it to register as a new agent.

![image](https://github.com/user-attachments/assets/e372e751-c838-4bf3-a9eb-b1e55131c161)

During the registration process, the created pool name is configured. The server URL is then connected, followed by authentication using a Personal Access Token (PAT). A new token must be created with the appropriate permissions. Once authenticated, the EC2 agent is registered in the pool.

![image](https://github.com/user-attachments/assets/823c9b67-ea00-44b3-8598-301a70b2b762)

Make sure to install and start the agent service on EC2 to be active agent in Azure DevOps.

![image](https://github.com/user-attachments/assets/36bfb1ca-eb8d-4bb5-8f4a-b06b3838a545)


### SSH EC2 connection setup

Before running the pipeline, configure the EC2 SSH credentials, including the username and public IP, under the service connection settings in Azure DevOps.

![image](https://github.com/user-attachments/assets/c544d37a-0ab2-45f4-b027-e28c522d05dd)


### Pipeline Workflow

The pipeline is triggered whenever code is pushed to GitHub. It consists of two main jobs: Building the Docker Image and Deploying the Docker Image.

#### Building the Docker Image

The Docker image is built using the `docker build` command.

Configured Dockerfile in the target EC2 instance will be built.

The built image is saved in the working directory of the target EC2 instance.

#### Deploying the Docker Image

The pipeline establishes an SSH connection to the EC2 instance using the pre-configured SSH credentials.

Before Deployment starts, it first removes any docker image which is same as the one about to deploy.

The deployment step runs `docker run `commands to start the container on the EC2 instance.

## Architecture Diagram

Usage

Simply push or commit code to GitHub to trigger the pipeline.

Alternatively, manually trigger the pipeline from Azure DevOps.

![image](https://github.com/user-attachments/assets/8bf8f335-03a0-433c-bc17-bfca9f75578a)

## Requirement

AWS EC2 instance with the Azure DevOps Agent installed and registered.

AWS EC2 instance with Git installed.

AWS EC2 instance with Docker installed.

A valid Dockerfile in the repository.

SSH connection to the target AWS EC2 instance configured under Azure DevOps service connections.

## Precaution

Ensure the target EC2 instance is up and running with all required configurations installed.

Update SSH connection credentials and the public IP of the target EC2 instance as needed.

## Author

Hsu Shun Lae

Github: https://github.com/20056371HsuShunLae
