# HTTP Server Project

This project contains a simple custom HTTP server implementation in Python during learning stage.

## Overview

The `mainHTTPSERVER.py` script runs a basic HTTP server that handles:
- **GET requests**: Serves a simple HTML page.
- **POST requests**: Returns the current server time in JSON format.

## Prerequisites

- Python 3.x

## How to Run

1.  Navigate to the `HTTP` directory.
2.  Run the server using Python:

    ```bash
    python mainHTTPSERVER.py
    ```

3.  The server will start on `localhost` (or your configured HOST) at port `9999`.

## Endpoints

### GET `/`
Returns a welcome HTML page.

### POST `/`
Returns a JSON object with the current time:
```json
{
  "time": "YYYY-MM-DD HH:MM:SS"
}
```
