import React from 'react'
import App, { Container } from 'next/app'
import Head from 'next/head'
import '../css/app.styl'

class MyApp extends App
  render: ->
    { Component, pageProps } = this.props

    <Container>
      <Head><title>App titleee</title></Head>
      <main>
        <Component {...pageProps} />
      </main>
    </Container>

export default MyApp
