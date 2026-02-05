from http.server import BaseHTTPRequestHandler,HTTPServer


class simpleRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("content-type" , "text/plain")
            self.end_headers()
            self.wfile.write(b"Home Page")
        elif self.path == "/contact":
            self.send_response(200)
            self.send_header("content_type","text/plain")
            self.end_headers()
            self.wfile.write(b"Phone:+1 023 064")
        else:
            self.send_response(404)
            self.send_header("content/type","text/plain")
            self.end_headers()
            self.wfile.write(b"Not Found")
server = HTTPServer(("localhost",9999),simpleRequestHandler)
print("Server is running")
server.serve_forever()