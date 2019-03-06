const nib = require('nib')
const rupture = require('rupture')
const withStylus = require('@zeit/next-stylus')
const poststylus = require('poststylus')
const autoprefixer = require('autoprefixer')
const withCoffeescript = require('next-coffeescript')

module.exports = withCoffeescript(
  withStylus({
    stylusLoaderOptions: {
      use: [
        nib(),
        rupture(),
        poststylus([
          autoprefixer({ flexbox: 'no-2009' }),
          require('postcss-css-variables'),
        ])
      ]
    },
    webpack(config, options) {
      config.module.rules.push({
        test: /\.(pug)$/,
        exclude: /node_modules/,
        loaders: [
          options.defaultLoaders.babel,
          {
            loader: 'pug-as-jsx-loader',
            options: {
              resolveComponents: {
                Head: 'next/head',
                Link: 'next/link',
                WithParams: '../components/with-params'
              }
            }
          }
        ],
      })
      return config
    }
  })
)
