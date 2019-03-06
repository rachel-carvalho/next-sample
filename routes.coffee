routes = require 'next-routes'

module.exports = routes()
  .add 'book', '/books/:isbn'
