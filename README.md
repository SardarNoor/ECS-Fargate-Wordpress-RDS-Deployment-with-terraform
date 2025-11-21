# **WordPress Deployment on Amazon ECS Fargate with RDS MySQL using Terraform (Modular + Public Subnets Only)**

This project deploys a fully functional **WordPress application** on **Amazon ECS Fargate**, connected to an **RDS MySQL database**, using **Terraform** with a clean **modular architecture** and **S3 remote backend**.

The entire deployment runs inside a **custom VPC with public subnets only**, as per requirement.

---

## **Architecture Overview**

**Components:**

* Custom VPC
* Two Public Subnets (different AZs)
* Internet Gateway + Public Route Table
* Security Groups (WordPress SG & RDS SG)
* RDS MySQL instance
* ECS Cluster (Fargate)
* ECS Task Definition (WordPress container)
* ECS Service
* IAM Execution Role
* Terraform S3 Backend
* Modular Terraform folder structure

**Architecture Diagram:**
 *TASK4 ECS Fargate (1).png*

---

## **Terraform Project Structure**

```
root/
 ├── backend.tf
 ├── providers.tf
 ├── main.tf
 ├── variables.tf
 ├── outputs.tf
 ├── modules/
 │    ├── vpc/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    ├── security-groups/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    ├── rds/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    ├── ecs-cluster/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    ├── task-definition/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    ├── ecs-service/
 │    │    ├── main.tf
 │    │    ├── variables.tf
 │    │    └── outputs.tf
 │    └── iam/
 │         ├── main.tf
 │         ├── variables.tf
 │         └── outputs.tf
```

---

## **Features**

* Fully automated deployment through Terraform
* Serverless compute using ECS Fargate
* Managed MySQL database using Amazon RDS
* Public-subnet-only architecture
* Secure SG-to-SG database communication
* Modular Terraform design
* Remote backend stored in Amazon S3

---

## **Modules Explained**

### **1. VPC Module**

Creates:

* VPC
* Two public subnets
* Internet gateway
* Public route table

### **2. Security Groups Module**

Creates:

* WordPress SG → allows HTTP (80)
* RDS SG → allows MySQL (3306) only from WordPress SG

### **3. RDS Module**

Creates:

* DB Subnet group
* MySQL instance
* Outputs RDS endpoint

### **4. ECS Cluster Module**

Creates:

* Cluster for running Fargate services

### **5. Task Definition Module**

Defines:

* WordPress container
* Port mappings
* Environment variables for RDS connection

### **6. ECS Service Module**

Creates:

* Fargate service
* Public IP enabled
* WordPress SG attached

### **7. IAM Module**

Creates:

* Execution role for ECS tasks

---

## **How to Deploy**

### **1. Initialize Terraform**

```
terraform init
```

### **2. Validate Configuration**

```
terraform validate
```

### **3. Generate Execution Plan**

```
terraform plan
```

### **4. Deploy Infrastructure**

```
terraform apply
```

---

## **How to Access WordPress**

1. Open **AWS Console → ECS → Cluster → Service → Task**
2. Copy the **Public IP** from task Network → ENI section
3. Open in browser:

```
http://<public-ip>
```

4. Complete WordPress installation wizard
5. WordPress dashboard will open successfully

---

## **Outputs**

Terraform outputs:

* ECS Task Public IP
* RDS Endpoint
* VPC ID
* Subnet IDs
* Security Group IDs

---

## **Testing**

* Verified ECS service running
* Verified Fargate task healthy
* Confirmed successful DB connectivity
* WordPress dashboard accessible
* RDS logs validated
* SG-to-SG communication working

---

## **Challenges & Solutions**

### **1. RDS Permission Denied**

The Internship1 AWS SSO role did not allow RDS creation.
Solution: Switched to CE_Internship2 role.

### **2. DB Subnet Group Already Exists**

Terraform error due to duplicate name.
Solution: Referenced existing subnet group.

### **3. IAM Role Already Exists**

Solution: Renamed or reused existing execution role.

### **4. ECS Task Logs Not Visible**

awslogs driver not configured.
Solution: Verified via RDS logs and WordPress interface.

---

## **Conclusion**

This project demonstrates a complete cloud-native deployment of WordPress using ECS Fargate and RDS through a clean, reusable Terraform IaC approach.
The system is fully automated, scalable, and easily extendable.

---

## **Author**

**Sardar Noor Ul Hassan**
Cloud Intern – Cloudelligent

---

