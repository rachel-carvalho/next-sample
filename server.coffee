next = require 'next'
routes = require './routes'
{createServer} = require 'http'

app = next dev: process.env.NODE_ENV != 'production'
handler = routes.getRequestHandler(app)

app.prepare().then -> createServer(handler).listen(3000)
