###  AWS EC2 Nginx Load Balancer with Terraform & Prometheus




A real-world DevOps project demonstrating infrastructure provisioning, load balancing, monitoring, and troubleshooting using modern cloud tools.

This project provisions AWS infrastructure using Terraform, deploys an Nginx web server on EC2, distributes traffic via Application Load Balancer, and monitors system metrics using Prometheus.

The project also demonstrates real production debugging scenarios encountered while deploying and monitoring cloud infrastructure.



##   Architecture Diagram

The following diagram represents the overall architecture of the project, showing how user requests flow through the system and how monitoring is integrated.

Internet
   │
   ▼
Application Load Balancer (AWS ALB)
   │
   ▼
EC2 Instance (Nginx Web Server)
   │
   ▼
Nginx Metrics Endpoint
   │
   ▼
Prometheus Server
   │
   ▼
Metrics Monitoring Dashboard


This architecture ensures that incoming traffic is distributed through the **Application Load Balancer**,
 routed to the **EC2 Nginx web server**, and monitored through **Prometheus metrics collection** for observability and performance tracking.


# Cloud Infrastructure Overview

Component	Purpose

AWS EC2	Host Nginx web server
Terraform	Infrastructure as Code

Application Load Balancer	Traffic distribution
Security Groups	Network access control

Nginx	Web server
Prometheus	Monitoring and metrics collection


## DevOps Workflow

This project follows a typical DevOps infrastructure lifecycle.

Code → Terraform → AWS Infrastructure → Nginx Server → Load Balancer → Monitoring → Debugging → Stable System
Deployment Flow

1️⃣ Infrastructure defined using Terraform

2️⃣ Terraform provisions EC2 instance

3️⃣ Nginx installed automatically

4️⃣ Application Load Balancer configured

5️⃣ Traffic routed to EC2

6️⃣ Prometheus monitors Nginx metrics


## Project Structure

aws-ec2-nginx-load-balancer
│
├── configs
│   └── nginx.conf
│
├── monitoring
│   ├── prometheus.yml
│
├── scripts
│   └── install-nginx.sh
│
├── terraform
│   ├── main.tf
│
└── docs
    └── screenshots


##  Infrastructure Deployment (Terraform)

Initialize Terraform
terraform init
Preview Infrastructure
terraform plan
Deploy Infrastructure
terraform apply

Terraform provisions:

EC2 instance

Security groups

Load balancer configuration

# Web Server Deployment

After infrastructure deployment, the Nginx server runs on the EC2 instance.

Access the web server:

http://3.109.216.95

Example output:

Hello from Rahul DevOps Web Server
AWS EC2 Load Balancer Project


# Application Load Balancer

The Application Load Balancer (ALB) distributes traffic across instances.

Benefits:

*High availability
*Traffic distribution
*Health checks
*Scalable architecture

## Monitoring with Prometheus

Prometheus collects metrics from the Nginx server.

Start Prometheus
./prometheus --config.file=prometheus.yml

Dashboard:

http://localhost:9090
 Prometheus Configuration
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: nginx
    static_configs:
      - targets: ['localhost:9113']


## DevOps Debugging & Troubleshooting

This project demonstrates real infrastructure debugging.

# Issue 1 — Terraform Credential Error

Terraform failed due to missing AWS credentials.

Error:

Error: No valid credential sources found
Fix

Configured AWS credentials using:

aws configure

Verification:

aws sts get-caller-identity

Terraform then authenticated successfully.

# Issue 2 — Prometheus Target DOWN

Prometheus initially showed:

nginx (0/1 up)
connection refused

Cause:

Metrics endpoint misconfigured

Exporter not running

🔧 Debugging Process

Steps taken:

1️⃣ Checked Prometheus configuration

2️⃣ Verified metrics endpoint

3️⃣ Restarted monitoring service

4️⃣ Confirmed metrics availability


##  Final Monitoring Status

After debugging:

nginx (1/1 up)

Prometheus successfully scraped metrics.



## Screenshots

Terraform Deployment

AWS Infrastructure

Load Balancer

Web Server

Prometheus Monitoring
Before Debugging

After Debugging


## DevOps Skills Demonstrated

✔ Infrastructure as Code
✔ Cloud infrastructure deployment
✔ Load balancing
✔ Monitoring and observability
✔ Debugging production systems
✔ Linux server configuration


## Key Learning Outcomes

Through this project I gained hands-on experience in:

Deploying infrastructure on AWS using Terraform

Configuring Nginx web servers

Setting up Application Load Balancers

Monitoring infrastructure using Prometheus

Debugging infrastructure issues in real environments


# Author

Rahul Rana

DevOps & Cloud Engineering Student

Technologies:

AWS | Terraform | Kubernetes | Jenkins | Linux | Docker

GitHub:  https://github.com/rahulrana16112005-design
