# TodoApp AWS Free Tier Lab Manual

This guide will help you deploy and run the TodoApp project using your AWS Free Tier account. No prior AWS or DevOps experience is required. Just follow each step carefully.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [AWS Account Setup](#aws-account-setup)
3. [Install Required Tools](#install-required-tools)
4. [Configure AWS Credentials](#configure-aws-credentials)
5. [Deploy Infrastructure with Terraform](#deploy-infrastructure-with-terraform)
6. [Deploy the Backend (Python)](#deploy-the-backend-python)
7. [Deploy the Frontend (React)](#deploy-the-frontend-react)
8. [Access the Application](#access-the-application)
9. [Cleanup Resources](#cleanup-resources)
10. [Troubleshooting](#troubleshooting)

---

## 1. Prerequisites

- A computer with internet access
- Basic knowledge of using a terminal/command prompt

---

## 2. AWS Account Setup

1. Go to [https://aws.amazon.com/free/](https://aws.amazon.com/free/) and sign up for a free AWS account.
2. Complete the registration and verify your email and phone number.
3. Log in to the [AWS Console](https://console.aws.amazon.com/).

---

## 3. Install Required Tools

Install the following tools on your computer:

### a. [Git](https://git-scm.com/downloads)
- Download and install Git for your operating system.

### b. [Python 3](https://www.python.org/downloads/)
- Download and install Python 3.x (choose "Add Python to PATH" during installation).

### c. [Node.js & npm](https://nodejs.org/)
- Download and install Node.js (npm comes bundled).

### d. [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Download and install Terraform.

### e. [AWS CLI](https://aws.amazon.com/cli/)
- Download and install the AWS Command Line Interface.

---

## 4. Configure AWS Credentials

1. Open a terminal (Command Prompt or PowerShell on Windows).
2. Run:
   ```
   aws configure
   ```
3. Enter your AWS Access Key ID, Secret Access Key, region (e.g., `us-east-1`), and output format (`json`).

---

## 5. Deploy Infrastructure with Terraform

1. Open a terminal and navigate to the `InfraAutomation/todoapp_infra` directory:
   ```
   cd path\to\TodoApp\InfraAutomation\todoapp_infra
   ```
2. Initialize Terraform:
   ```
   terraform init
   ```
3. Review the plan:
   ```
   terraform plan
   ```
4. Apply the infrastructure (type `yes` when prompted):
   ```
   terraform apply
   ```
   - This will create AWS resources (EC2, RDS, S3, VPC, IAM roles) as defined in the Terraform files.
   - Wait for the process to complete. Note the outputs (public IPs, endpoints) shown at the end.

---

## 6. Deploy the Backend (Python)

1. Connect to the EC2 instance created by Terraform:
   - Find the public IP address from the Terraform output.
   - Use SSH to connect (replace `<ec2-user>` and `<public-ip>`):
     ```
     ssh ec2-user@<public-ip>
     ```
   - On Windows, you can use [PuTTY](https://www.putty.org/) or Git Bash.

2. Once connected, install Python dependencies:
   ```
   sudo yum update -y
   sudo yum install python3 -y
   sudo pip3 install -r /home/ec2-user/PyTodoBackendMonolith/requirements.txt
   ```

3. Set up environment variables for database connection (use RDS info from Terraform output):
   ```
   export DB_HOST=<rds-endpoint>
   export DB_USER=<db-username>
   export DB_PASS=<db-password>
   export DB_NAME=<db-name>
   ```

4. Start the backend server:
   ```
   python3 /home/ec2-user/PyTodoBackendMonolith/app.py
   ```

---

## 7. Deploy the Frontend (React)

1. On your local machine, open a new terminal.
2. Navigate to the frontend directory:
   ```
   cd path\to\TodoApp\FrontendTodo\ReactTodoUIMonolith
   ```
3. Install dependencies:
   ```
   npm install
   ```
4. Update the API endpoint in the frontend code (if needed) to point to your EC2 instance’s public IP.
   - Edit `src/TodoApp.js` or relevant file and set the backend API URL.

5. Start the React app:
   ```
   npm start
   ```
   - The app will open in your browser at [http://localhost:3000](http://localhost:3000).

---

## 8. Access the Application

- Open your browser and go to [http://localhost:3000](http://localhost:3000) to use the TodoApp.
- The frontend will communicate with the backend running on your EC2 instance.

---

## 9. Cleanup Resources

To avoid AWS charges, destroy all resources when done:

1. In the terminal, go to the Terraform directory:
   ```
   cd path\to\TodoApp\InfraAutomation\todoapp_infra
   ```
2. Run:
   ```
   terraform destroy
   ```
   - Type `yes` when prompted.

---

## 10. Troubleshooting

- **Permission errors:** Ensure your AWS user has sufficient permissions.
- **Connection issues:** Check security group rules in AWS to allow inbound traffic (ports 22 for SSH, 5000 for backend, 3000 for frontend if needed).
- **Dependency errors:** Ensure all required tools are installed and up to date.

---

## Need Help?

- AWS Documentation: https://docs.aws.amazon.com/
- Terraform Docs: https://developer.hashicorp.com/terraform/docs
- React Docs: https://react.dev/
- Python Docs: https://docs.python.org/3/

---

**Congratulations!** You have deployed the TodoApp on AWS Free Tier.