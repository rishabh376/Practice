# TodoApp

## Overview
TodoApp is a full-stack application that allows users to manage their tasks efficiently. The project is divided into three main components: a React frontend, a Python backend, and infrastructure automation using Terraform for deployment on AWS.

## Project Structure
- **FrontendTodo**: Contains the React frontend application.
  - **ReactTodoUIMonolith**: The main React application.
    - **public**: Contains static files such as HTML, icons, and manifest.
    - **src**: Contains the source code for the React application, including components and styles.
  
- **InfraAutomation**: Contains Terraform scripts for provisioning AWS resources.
  - **modules**: Contains reusable Terraform modules for various AWS services.
  - **todoapp_infra**: The main Terraform configuration for the TodoApp infrastructure.

- **PyTodoBackendMonolith**: Contains the Python backend application.
  - **app.py**: The main application logic for the backend.
  - **requirements.txt**: Lists the dependencies required for the Python backend.

## Getting Started

### Prerequisites
- Node.js and npm installed for the frontend.
- Python and pip installed for the backend.
- Terraform installed for infrastructure automation.
- An AWS account for deploying the infrastructure.

### Frontend Setup
1. Navigate to the `FrontendTodo/ReactTodoUIMonolith` directory.
2. Install dependencies:
   ```
   npm install
   ```
3. Start the development server:
   ```
   npm start
   ```

### Backend Setup
1. Navigate to the `PyTodoBackendMonolith` directory.
2. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
3. Run the backend application:
   ```
   python app.py
   ```

### Infrastructure Setup
1. Navigate to the `InfraAutomation/todoapp_infra` directory.
2. Initialize Terraform:
   ```
   terraform init
   ```
3. Plan the infrastructure:
   ```
   terraform plan
   ```
4. Apply the configuration:
   ```
   terraform apply
   ```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.