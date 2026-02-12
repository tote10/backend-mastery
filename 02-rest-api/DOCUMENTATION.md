# REST API Documentation

This document provides detailed information about the API endpoints available in the application.

## Base URL

All endpoints are relative to the base URL: `http://127.0.0.1:8000`

## Endpoints

### 1. Root

-   **URL**: `/`
-   **Method**: `GET`
-   **Description**: Returns a simple welcome message.
-   **Response**:
    ```json
    {
      "Hello": "Rest API"
    }
    ```

### 2. Create Item

-   **URL**: `/items`
-   **Method**: `POST`
-   **Description**: Adds a new item to the in-memory list.
-   **Parameters**:
    -   `item` (query parameter, required): The string content of the item to add.
-   **Response**:
    ```json
    {
      "message": "Item added successfully"
    }
    ```
-   **Example Request**:
    ```bash
    curl -X POST "http://127.0.0.1:8000/items?item=my_new_item"
    ```

### 3. Get Item by ID

-   **URL**: `/items/{item_id}`
-   **Method**: `GET`
-   **Description**: Retrieves an item based on its index in the list.
-   **Parameters**:
    -   `item_id` (path parameter, required): The integer index of the item.
-   **Response (Success)**:
    -   Returns the string content of the item.
    -   Example: `"my_new_item"`
-   **Response (Error - 404)**:
    -   If the `item_id` is out of range.
    ```json
    {
      "detail": "Item not found"
    }
    ```

## Error Handling

The API uses standard HTTP status codes:
-   `200 OK`: Successful request.
-   `404 Not Found`: The requested resource (item ID) does not exist.
-   `422 Validation Error`: Invalid input data (handled automatically by FastAPI).
