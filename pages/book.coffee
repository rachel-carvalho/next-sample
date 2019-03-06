import { Component } from 'react'

import template from '../templates/book.pug'

books =[
  isbn: '0553560735'
  title: 'Red Mars'
  description: 'For centuries, the barren, desolate landscape of the red planet has beckoned to humankind. Now a group of one hundred colonists begins a mission whose ultimate goal is to transform Mars into a more Earthlike planet. They will place giant satellite mirrors in Martian orbit to reflect light to the surface. Black dust sprinkled on the polar caps will capture warmth and melt the ice. And massive tunnels drilled into the mantle will create stupendous vents of hot gases. But despite these ambitious goals, there are some who would fight to the death to prevent Mars from ever being changed.'
]
class Book extends Component
  @getInitialProps: ({ query, res }) ->
    await book = books.find (b) -> b.isbn == query.isbn
    res.statusCode = 404 if res && !book
    {book}

  render: ->
    template.call(this, @props.book)

export default Book
