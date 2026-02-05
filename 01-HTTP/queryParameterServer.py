from http.server import BaseHTTPRequestHandler,HTTPServer
from urllib.parse import urlparse,parse_qs

class queryHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed_url= urlparse(self.path)
        path = parsed_url.path
        query = parse_qs(parsed_url.query)
        if path == "/isEven":
            if "n" not in query:
                self.send_response(400)
                self.send_header("content-type","text/plain")
                self.end_headers()
                self.wfile.write(b"Missing Query")
                return
            
            n= int(query["n"][0])#taking the first number if a user gives as a list of number by indexing
            result = b"odd" if n%2 else b"even"
            self.send_response(200)
            self.send_header("content-type","text/plain")
            self.end_headers()
            self.wfile.write(result)
server = HTTPServer(("localhost",9999),queryHandler)
print("server is runing")
server.serve_forever()