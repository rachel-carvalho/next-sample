import NextApp, { Container } from 'next/app'
import Nav from '../components/nav'

import '../css/app.styl'
import template from '../templates/_app.pug'

class App extends NextApp
  render: ->
    { Component, pageProps } = @props
    template.call this, {pageProps, Component, Container, Nav}

export default App
