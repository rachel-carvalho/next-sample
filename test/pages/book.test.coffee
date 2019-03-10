import {shallow} from 'enzyme'
import voidify from '../support/voidify'
import Error from 'next/error'

import Book from '../../pages/book'

import books from '../../data/books'

describe 'book page', voidify ->
  it 'renders', ->
    book = shallow(<Book book={title: "The Dispossessed", author: "Ursula K. LeGuin", isbn: "1234", description: "Hard to say without spoiling the book."} />)
    expect(book.find('Head title').text()).toEqual 'The Dispossessed'
    expect(book.find('h1').text()).toEqual 'The Dispossessed'
    expect(book.find('p.author').text()).toEqual 'Ursula K. LeGuin'
    expect(book.find('span').text()).toEqual 'ISBN 1234'
    expect(book.find('p').at(1).text()).toEqual 'Hard to say without spoiling the book.'

  it 'renders error when book is empty', ->
    book = shallow(<Book />)
    expect(book.matchesElement(<Error />)).toBeTruthy()
    expect(book.equals(<Error statusCode={404} />)).toBeTruthy()

  describe '@getInitialProps', voidify ->
    it 'returns book: undefined when query is not present', ->
      await expect(Book.getInitialProps({})).resolves.toEqual book: undefined

    it 'returns book: undefined when query.isbn is not present', ->
      await expect(Book.getInitialProps(query: {})).resolves.toEqual book: undefined

    it 'returns book: undefined when query.isbn is not in books array', ->
      await expect(Book.getInitialProps(query: { isbn: '123' })).resolves.toEqual book: undefined

    it 'sets status code as 404 when book is not found', ->
      res = statusCode: 200
      await Book.getInitialProps({res})
      expect(res.statusCode).toEqual 404

    it 'returns a book when query.isbn is in books array', ->
      [book] = books
      await expect(Book.getInitialProps(query: { isbn: book.isbn })).resolves.toEqual {book}
