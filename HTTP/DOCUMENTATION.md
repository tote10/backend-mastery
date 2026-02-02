# HTTP Server Documentation

## `mainHTTPSERVER.py`

This script uses Python's built-in `http.server` module to create a custom HTTP server.

### Class `requestHandler`

Inherits from `BaseHTTPRequestHandler`.

#### `do_GET(self)`
Handles HTTP GET requests.
- Sets response status to 200.
- Sets `Content-type` header to `text/html`.
- Returns a simple HTML string: `<html><body><h1>Main Page</h1></body></html>`.

#### `do_POST(self)`
Handles HTTP POST requests.
- Sets response status to 200.
- Sets `Content-type` header to `application/json`.
- Calculates current time using `time` module.
- Returns JSON response: `{"time" : "<current_date_time>"}`.

### Configuration
- **HOST**: Set to `localhost`.
- **PORT**: `9999`.

## `stage-01-http-fundamentals/raw-server.py`

This script demonstrates a basic server using the `tornado` framework.
- **basicRequestHandler**: Returns "hello world!!".
- **staticRequestHandler**: Renders "index.html".
- **queryStringRequestHandler**: Checks if a number `n` passed in query string is odd or even.
- **resourceRequestHandler**: Takes an ID from the URL path.
