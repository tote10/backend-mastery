import tornado
import tornado.ioloop

class basicRequestHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("hello world!!")
class staticRequestHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("index.html")

class queryStringRequestHandler(tornado.web.RequestHandler):
    def get(self):
        n=int(self.get_argument("n"))
        r = "odd" if n%2 else "even"
        self.write("the number "+ str(n) + " is " + r)

class resourceRequestHandler(tornado.web.RequestHandler):
    def get(self,n):
        self.write("querying tweet with id " + n)

if __name__ == "__main__":
    app=tornado.web.Application([
        (r"/",basicRequestHandler),
        (r"/static",staticRequestHandler),
        (r"/isEven",queryStringRequestHandler),
        (r"/tweet/([0-9]+)",resourceRequestHandler)

    ])
    app.listen(8880)
    print("hey i'm listiening on port 8000")
    tornado.ioloop.IOLoop.current().start()



