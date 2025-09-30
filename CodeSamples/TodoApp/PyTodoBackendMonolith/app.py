from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

todos = []

@app.route('/todos', methods=['GET'])
def get_todos():
    return jsonify(todos)

@app.route('/todos', methods=['POST'])
def add_todo():
    todo = request.json.get('todo')
    if todo:
        todos.append({'id': len(todos) + 1, 'todo': todo})
        return jsonify({'message': 'Todo added!'}), 201
    return jsonify({'message': 'Todo is required!'}), 400

@app.route('/todos/<int:todo_id>', methods=['DELETE'])
def delete_todo(todo_id):
    global todos
    todos = [todo for todo in todos if todo['id'] != todo_id]
    return jsonify({'message': 'Todo deleted!'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)