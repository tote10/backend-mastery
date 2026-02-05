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
                