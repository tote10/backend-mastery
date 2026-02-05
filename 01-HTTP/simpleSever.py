from http.server import BaseHTTPRequestHandler ,HTTPServer

class simpleRequesrHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","text/plain")
        self.end_headers()
        self.wfile.write(b"Hello World")
        print("GET request received")
        print("command is" + self.command)
        print("path is" + self.path)
        print("request version is ",self.request_version)
        print("headers is ",self.headers)
        print("server is " , self.server)
        print("connection is " , self.connection)
       
        print("self is " , self.wfile)
        print("close connection is " , self.close_connection)
        print("command is " , self.command)
        print("path is " , self.path)
        print("request version is " , self.request_version)
        print("headers is " , self.headers)
        print("client address is " , self.client_address)
        
        print("server is " , self.server)
        print("connection is " , self.connection)
        print("rfile is " , self.rfile)
        print("wfile is " , self.wfile)
        print("close connection is " , self.close_connection)
if __name__ == "__main__":
    server = HTTPServer(("localhost",8000),simpleRequesrHandler)
    print("Server started on port 8000")
    server.serve_forever()
