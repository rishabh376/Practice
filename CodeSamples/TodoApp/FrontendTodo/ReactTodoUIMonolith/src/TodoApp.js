import React, { useState, useEffect } from 'react';

const TodoApp = () => {
    const [todos, setTodos] = useState([]);
    const [inputValue, setInputValue] = useState('');

    useEffect(() => {
        const fetchTodos = async () => {
            const response = await fetch('https://your-api-endpoint/todos');
            const data = await response.json();
            setTodos(data);
        };
        fetchTodos();
    }, []);

    const handleInputChange = (event) => {
        setInputValue(event.target.value);
    };

    const handleAddTodo = async () => {
        if (inputValue.trim()) {
            const newTodo = { text: inputValue, completed: false };
            const response = await fetch('https://your-api-endpoint/todos', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(newTodo),
            });
            const addedTodo = await response.json();
            setTodos([...todos, addedTodo]);
            setInputValue('');
        }
    };

    const handleToggleTodo = async (id) => {
        const todoToUpdate = todos.find(todo => todo.id === id);
        const updatedTodo = { ...todoToUpdate, completed: !todoToUpdate.completed };

        await fetch(`https://your-api-endpoint/todos/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(updatedTodo),
        });

        setTodos(todos.map(todo => (todo.id === id ? updatedTodo : todo)));
    };

    const handleDeleteTodo = async (id) => {
        await fetch(`https://your-api-endpoint/todos/${id}`, {
            method: 'DELETE',
        });

        setTodos(todos.filter(todo => todo.id !== id));
    };

    return (
        <div>
            <h1>Todo App</h1>
            <input
                type="text"
                value={inputValue}
                onChange={handleInputChange}
                placeholder="Add a new todo"
            />
            <button onClick={handleAddTodo}>Add Todo</button>
            <ul>
                {todos.map(todo => (
                    <li key={todo.id}>
                        <span
                            style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}
                            onClick={() => handleToggleTodo(todo.id)}
                        >
                            {todo.text}
                        </span>
                        <button onClick={() => handleDeleteTodo(todo.id)}>Delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default TodoApp;