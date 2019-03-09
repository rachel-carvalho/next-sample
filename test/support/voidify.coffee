# voidifies a coffee function to prevent warnings from jest:
#  console.log node_modules/jest-jasmine2/build/jasmine/Env.js:441
#        ● Test suite failed to run
#
#          A "describe" callback must not return a value.
#          Returning a value from "describe" will fail the test in a future version of Jest.

export default voidify = (fn) ->
  ->
    fn(...arguments)
    undefined
