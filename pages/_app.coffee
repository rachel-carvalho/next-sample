import React from 'react'
import App, { Container } from 'next/app'
import Head from 'next/head'
import WithParams from '../components/with-params'

import '../css/app.styl'
import template from '../templates/_app.pug'


class MyApp extends App
  render: ->
    { Component, pageProps } = @props
    template.call this, {pageProps, Component, Container, Head, WithParams}

export default MyApp
