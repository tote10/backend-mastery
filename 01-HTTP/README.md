# HTTP Server Project

This project contains simple custom HTTP server implementations in Python to learn backend fundamentals.

## Overview

This directory contains several scripts demonstrating different aspects of HTTP servers:

*   **`simpleSever.py`**: A basic HTTP server that logs request details and returns "Hello World".
*   **`routeServer.py`**: Demonstrates basic routing (handling `/` and `/contact` endpoints).
*   **`queryParameterServer.py`**: handled query parameters (e.g., checking if a number is odd or even).
*   **`tornadoServer.py`**: An introduction to using the Tornado framework for asynchronous networking.

## Prerequisites

*   Python 3.x
*   Tornado (for `tornadoServer.py`): `pip install tornado`

## How to Run

Navigate to the `HTTP` directory and run the desired server script:

### Simple Server
```bash
python simpleSever.py
```
*   Runs on port `8000`.

### Route Server
```bash
python routeServer.py
```
*   Runs on port `9999`.

### Query Parameter Server
```bash
python queryParameterServer.py
```
*   Runs on port `9999`.

### Tornado Server
```bash
python tornadoServer.py
```
*   Runs on port `8880`.
