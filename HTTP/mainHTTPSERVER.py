from http.server import HTTPServer,BaseHTTPRequestHandler
import time


HOST = "192.168.1.4"
PORT = 9999
class requestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"<html><body><h1>Main Page</h1></body></html>")
    def do_POST(self):
        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()
        date = time.strftime("%Y-%m-%d %H:%M:%S" , time.localtime(time.time()))
        self.wfile.write(bytes(f'{{"time" : "{date}"}}', "utf-8"))
server = HTTPServer((HOST,PORT),requestHandler)
print("server started")
server.serve_forever()

server.server_close()
print("server closed")