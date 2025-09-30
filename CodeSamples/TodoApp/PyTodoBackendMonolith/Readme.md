# PyTodoBackendMonolith Readme.md

# Todo Application Backend

This is the backend component of the Todo application, built using Python. It serves as the API for managing todo items.

## Requirements

- Python 3.x
- Flask
- Flask-CORS

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd PyTodoBackendMonolith
   ```

2. Create a virtual environment:
   ```
   python -m venv venv
   ```

3. Activate the virtual environment:
   - On Windows:
     ```
     venv\Scripts\activate
     ```
   - On macOS/Linux:
     ```
     source venv/bin/activate
     ```

4. Install the required packages:
   ```
   pip install -r requirements.txt
   ```

## Running the Application

To run the application, execute the following command:
```
python app.py
```

The API will be available at `http://localhost:5000`.

## API Endpoints

- `GET /todos`: Retrieve all todo items.
- `POST /todos`: Create a new todo item.
- `PUT /todos/<id>`: Update an existing todo item.
- `DELETE /todos/<id>`: Delete a todo item.

## Deployment on AWS

This backend can be deployed on AWS using services like EC2 or Lambda. Ensure that the necessary IAM roles and security groups are configured for access.

## License

This project is licensed under the MIT License.