import React from 'react'
import App, { Container } from 'next/app'
import Head from 'next/head'
import '../css/app.styl'

class MyApp extends App {
  render () {
    const { Component, pageProps } = this.props

    return (
      <Container>
        <Head><title>App title</title></Head>
        <main>
          <Component {...pageProps} />
        </main>
      </Container>
    )
  }
}

export default MyApp
