# Project Setup Guide

This document provides step-by-step instructions to deploy the **AWS EC2 Nginx Load Balancer with Prometheus Monitoring** infrastructure.

The project provisions cloud infrastructure using **Terraform**, deploys an **Nginx web server on EC2**, configures an **Application Load Balancer**, and sets up **Prometheus monitoring**.

---

# Prerequisites

Before starting, make sure the following tools are installed:

* AWS CLI
* Terraform
* Git
* Linux / WSL / macOS terminal
* AWS Account with permissions to create EC2 resources

Verify installations:

```
aws --version
terraform --version
git --version
```

---

# Step 1 — Clone the Repository

Clone the project repository:

```
git clone https://github.com/rahulrana16112005/aws-ec2-nginx-load-balancer.git
```

Navigate into the project directory:

```
cd aws-ec2-nginx-load-balancer
```

---

# Step 2 — Configure AWS Credentials

Terraform requires AWS credentials to provision resources.

Configure AWS CLI:

```
aws configure
```

Enter:

```
AWS Access Key ID
AWS Secret Access Key
Default region name: ap-south-1
Output format: json
```

Verify credentials:

```
aws sts get-caller-identity
```

---

# Step 3 — Initialize Terraform

Navigate to the Terraform directory:

```
cd terraform
```

Initialize Terraform:

```
terraform init
```

This downloads required providers and modules.

---

# Step 4 — Review Infrastructure Plan

Preview resources Terraform will create:

```
terraform plan
```

Expected output example:

```
Plan: 1 to add, 0 to change, 0 to destroy
```

---

# Step 5 — Deploy Infrastructure

Apply Terraform configuration:

```
terraform apply
```

Confirm deployment:

```
yes
```

Terraform will create:

* AWS EC2 instance
* Security groups
* Networking configuration

---

# Step 6 — Verify EC2 Instance

Open the AWS Console:

EC2 → Instances

Ensure the instance status shows:

```
Instance State: Running
Status Checks: 2/2 passed
```

Copy the **Public IP Address**.

---

# Step 7 — Verify Nginx Web Server

Open the public IP in a browser:

```
http://3.109.216.95
```

Expected output:

```
Hello from Rahul DevOps Web Server
AWS EC2 Load Balancer Project
```

This confirms that Nginx is successfully deployed.

---

# Step 8 — Create Application Load Balancer

In AWS Console:

EC2 → Load Balancers → Create Load Balancer

Configuration:

```
Type: Application Load Balancer
Scheme: Internet-facing
Listener: HTTP (Port 80)
Target: EC2 instance
```

Register the EC2 instance in the **Target Group**.

Once the load balancer becomes **Active**, copy the DNS name.

Access the application:

```
http://13.126.186.131
```

---

# Step 9 — Install Prometheus

Navigate to the monitoring directory:

```
cd monitoring
```

Download Prometheus:

```
wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
```

Extract files:

```
tar -xvf prometheus-2.52.0.linux-amd64.tar.gz
cd prometheus-2.52.0.linux-amd64
```

Start Prometheus:

```
./prometheus --config.file=../prometheus.yml
```

---

# Step 10 — Access Prometheus Dashboard

Open:

```
http://localhost:9090
```

Navigate to:

```
Status → Targets
```

Ensure the target status shows:

```
UP
```

---

# Troubleshooting

## Terraform Credential Error

Error:

```
Error: No valid credential sources found
```

Fix:

```
aws configure
```

---

## Prometheus Target DOWN

Possible causes:

* Exporter not running
* Incorrect port configuration
* Incorrect scrape target

Verify configuration in:

```
monitoring/prometheus.yml
```

Restart Prometheus after changes.

---

# Clean Up Resources

To avoid AWS charges, destroy infrastructure after testing:

```
terraform destroy
```

Confirm:

```
yes
```

This removes all AWS resources created by Terraform.

---

# Author

Rahul Rana
DevOps Cloud Engineering Student

Technologies:

AWS • Terraform • Kubernetes • Jenkins • Linux
