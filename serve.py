from http.server import SimpleHTTPRequestHandler
from socketserver import TCPServer

PORT = 8080

handler = SimpleHTTPRequestHandler

with TCPServer(("", PORT), handler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
