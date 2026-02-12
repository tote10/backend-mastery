# REST API with FastAPI

This project demonstrates a basic REST API built using the [FastAPI](https://fastapi.tiangolo.com/) framework. It serves as an introduction to creating API endpoints, handling different HTTP methods, and managing in-memory data.

## Features

- **FastAPI Framework**: Utilizes FastAPI for high performance and easy API creation.
- **In-Memory Storage**: Uses a simple list to store items (data types: strings).
- **CRUD Operations**: Implements Create (POST) and Read (GET) operations.
- **Automatic Documentation**: Built-in interactive API documentation via Swagger UI.

## Prerequisites

- Python 3.6+
- `pip` (Python package installer)

## Installation

1.  Navigate to the project directory:
    ```bash
    cd 02-rest-api
    ```

2.  (Optional) Create and activate a virtual environment:
    ```bash
    python -m venv venv
    # Windows
    venv\Scripts\activate
    # macOS/Linux
    source venv/bin/activate
    ```

3.  Install the required dependencies:
    ```bash
    pip install fastapi uvicorn
    ```

## Usage

### Running the Server

Start the development server with auto-reload enabled:

```bash
uvicorn main:app --reload
```

The API will be accessible at `http://127.0.0.1:8000`.

### API Endpoints

-   **GET /**: Returns a welcome message.
-   **POST /items**: Adds a new item to the list.
-   **GET /items/{item_id}**: Retrieves an item by its index.

For detailed API documentation, see [DOCUMENTATION.md](./DOCUMENTATION.md).

## interactive Documentation

FastAPI provides automatic interactive documentation. Once the server is running, you can access:

-   **Swagger UI**: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)
-   **ReDoc**: [http://127.0.0.1:8000/redoc](http://127.0.0.1:8000/redoc)
