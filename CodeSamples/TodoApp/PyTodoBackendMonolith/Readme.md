# PyTodoBackendMonolith Readme.md

# PyTodo Backend Monolith

This is the backend service for the Todo application, built using Python. It provides RESTful APIs to manage todo items.

## Requirements

- Python 3.7 or higher
- Flask
- Flask-CORS
- Flask-SQLAlchemy

## Installation

1. Clone the repository:

   git clone <repository-url>

2. Navigate to the project directory:

   cd PyTodoBackendMonolith

3. Install the required packages:

   pip install -r requirements.txt

## Running the Application

To run the application, execute the following command:

python app.py

The application will start on `http://localhost:5000`.

## API Endpoints

- `GET /todos`: Retrieve all todos.
- `POST /todos`: Create a new todo.
- `PUT /todos/<id>`: Update an existing todo.
- `DELETE /todos/<id>`: Delete a todo.

## Deployment on AWS

This application can be deployed on AWS using the provided Terraform scripts in the `InfraAutomation` directory. Ensure you have the AWS CLI configured with your credentials.

## License

This project is licensed under the MIT License. See the LICENSE file for details.