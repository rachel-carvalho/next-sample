const coffee = require('coffeescript');
const babelJest = require('babel-jest');
const pugUtils = require('pug-as-jsx-utils');

module.exports = {
  process: (src, path, config) => {
    if (!/node_modules/.test(path)) {
      // CoffeeScript files need to be compiled by CoffeeScript
      // before being processed by babel
      if (coffee.helpers.isCoffee(path)) {
        src = coffee.compile(src, { bare: true });
      }
      if (/\.pug$/.test(path)) {
        src = pugUtils.pugToJsx(src, { template: true }).jsxTemplate
      }
      return babelJest.process(src, path, config);
    }
    return src;
  }
};
