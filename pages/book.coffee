import { Component } from 'react'
import Error from 'next/error'

import template from '../templates/book.pug'

import books from '../data/books'

class Book extends Component
  @getInitialProps: ({ query, res }) ->
    await book = query?.isbn && books.find (b) -> b.isbn == query.isbn
    res?.statusCode = 404 unless book
    {book}

  render: ->
    unless @props.book
      return (<Error statusCode={404} />)
    template.call(this, @props.book)

export default Book
