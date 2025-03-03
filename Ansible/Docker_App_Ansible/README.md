# Automatic Docker Container Deployment

This document outlines the configuration and automatic deployment of a Docker container using Ansible. It provides details on the Dockerfile setup, the Ansible playbook, required dependencies, and precautionary steps to ensure smooth deployment.

## Workflow

### Application Setup

A simple Flask web application is initially configured. The Dockerfile is then created to run this Flask web application on port 80. Finally, Ansible is set up to deploy this Dockerfile automatically.

### Ansible Workflow

The playbook starts by connecting to the target EC2 instance using the pre-configured hosts file. This file contains the EC2 SSH credentials, public IP, and user information.
Then, it builds the Docker image using: `docker build -t <name> .` After that it removes any existing Docker container with the same name as the one being deployed.
Finally, it deploys the Docker image by docker command: `docker run -d -p 80:80 --name <name> <name of built image>`

## Requirements

A system with Ansible installed

Docker and Docker Engine installed on the target machine

SSH access to the target machine (EC2 instance)

Werkzeug==2.0.3

Flask==2.0.3

## Usage

Run the ansible playbook:

```
ansible-playbook -i ../hosts deploy.yml
```

Verify Deployment:

```
docker ps
```

##  Precaution

Ensure your hosts file path when running playbook.

Ensure your hosts file is configured by your EC2's ssh credentials, user and public ip.

Ensure firewall and security groups allow necessary connections.

Validate the Dockerfile to avoid build errors.

## Author 

Hsu Shun Lae

Github: https://github.com/20056371HsuShunLae


