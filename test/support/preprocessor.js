const coffee = require('coffeescript');
const babelJest = require('babel-jest');
const pugUtils = require('pug-as-jsx-utils');

module.exports = {
  process: (src, file, config) => {
    if (!/node_modules/.test(file)) {
      // CoffeeScript files need to be compiled by CoffeeScript
      // before being processed by babel
      if (coffee.helpers.isCoffee(file)) {
        src = coffee.compile(src, { bare: true });
      }
      if (/\.pug$/.test(file)) {
        src = pugUtils.pugToJsx(src, {
          template: true,
          resolve: {
            'next/head': { name: 'Head' },
            '../components/with-params': { name: 'WithParams' }
          }
        }).jsxTemplate
      }
      return babelJest.process(src, file, config);
    }
    return src;
  }
};
