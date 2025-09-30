# Todo Application

This Todo application consists of a frontend built with React and a backend developed in Python. The application allows users to create, read, update, and delete todo items. It is designed to be deployed on AWS using Terraform for infrastructure automation.

## Project Structure

```
TodoApp
├── FrontendTodo
│   └── ReactTodoUIMonolith
│       ├── .gitignore
│       ├── package.json
│       ├── README.md
│       ├── public
│       │   ├── index.html
│       │   ├── manifest.json
│       │   └── robots.txt
│       └── src
│           ├── App.css
│           ├── App.js
│           ├── App.test.js
│           ├── index.css
│           ├── index.js
│           ├── logo.svg
│           ├── reportWebVitals.js
│           ├── setupTests.js
│           ├── theme.js
│           └── TodoApp.js
├── InfraAutomation
│   ├── modules
│   │   ├── aws_iam_role
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   ├── aws_instance
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   ├── aws_s3_bucket
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   ├── aws_rds_instance
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   │   └── aws_vpc
│   │       ├── main.tf
│   │       └── variables.tf
│   └── todoapp_infra
│       ├── main.tf
│       ├── provider.tf
│       └── variables.tf
├── PyTodoBackendMonolith
│   ├── .gitignore
│   ├── app.py
│   ├── Readme.md
│   └── requirements.txt
└── README.md
```

## Getting Started

### Prerequisites

- Node.js and npm installed for the frontend.
- Python and pip installed for the backend.
- Terraform installed for infrastructure automation.
- An AWS account to deploy the application.

### Frontend Setup

1. Navigate to the `FrontendTodo/ReactTodoUIMonolith` directory.
2. Install the dependencies:

   ```
   npm install
   ```

3. Start the development server:

   ```
   npm start
   ```

4. Open your browser and go to `http://localhost:3000` to view the application.

### Backend Setup

1. Navigate to the `PyTodoBackendMonolith` directory.
2. Install the required Python packages:

   ```
   pip install -r requirements.txt
   ```

3. Run the backend application:

   ```
   python app.py
   ```

4. The backend API will be available at `http://localhost:5000`.

### Infrastructure Setup

1. Navigate to the `InfraAutomation/todoapp_infra` directory.
2. Initialize Terraform:

   ```
   terraform init
   ```

3. Plan the infrastructure deployment:

   ```
   terraform plan
   ```

4. Apply the changes to create the infrastructure:

   ```
   terraform apply
   ```

## Usage

Once both the frontend and backend are running, you can use the Todo application to manage your tasks. The frontend communicates with the backend API to perform CRUD operations on todo items.

## License

This project is licensed under the MIT License. See the LICENSE file for details.