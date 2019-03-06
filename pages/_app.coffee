import App, { Container } from 'next/app'

import '../css/app.styl'
import template from '../templates/_app.pug'

class MyApp extends App
  render: ->
    { Component, pageProps } = @props
    template.call this, {pageProps, Component, Container}

export default MyApp
