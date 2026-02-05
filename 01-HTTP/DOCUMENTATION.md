# HTTP Server Documentation

Detailed documentation for the scripts in this directory.

## `simpleSever.py`

A basic implementation using `http.server.BaseHTTPRequestHandler`.

### Class `simpleRequesrHandler`
- **`do_GET(self)`**:
    - Sets response status to 200 and content-type to `text/plain`.
    - Returns the body: `Hello World`.
    - **Logging**: Prints extensive details about the request to the console, including:
        - Command (method)
        - Path
        - Request version
        - Headers
        - Server and connection objects

## `routeServer.py`

Demonstrates manual routing within the request handler.

### Class `simpleRequestHandler`
- **`do_GET(self)`**: Checks `self.path` to determine the response.
    - **`/`**: Returns "Home Page" (Status 200).
    - **`/contact`**: Returns "Phone:+1 023 064" (Status 200).
    - **Other paths**: Returns "Not Found" with Status 404.

## `queryParameterServer.py`

Handles URL query parameters using `urllib.parse`.

### Class `queryHandler`
- **`do_GET(self)`**:
    - Parses the URL structure to extract the path and query string.
    - **Route `/isEven`**:
        - Checks for parameter `n` in the query string.
        - If `n` is missing: Returns 400 "Missing Query".
        - If `n` is present: Parses it as an integer and returns "odd" or "even".

## `tornadoServer.py`

Introduction to the **Tornado** web framework.

### Handlers
- **`basicRequestHandler`** (`/`): Returns "hello world!!".
- **`staticRequestHandler`** (`/static`): Renders `index.html`.
- **`queryStringRequestHandler`** (`/isEven`):
    - Uses `self.get_argument("n")` to get logical parameters.
    - Returns whether the number is odd or even.
- **`resourceRequestHandler`** (`/tweet/([0-9]+)`):
    - Uses regex in the application routing to capture a path parameter.
    - Returns "querying tweet with id <id>".
