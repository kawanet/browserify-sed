/**
 * browserify-sed
 */

const through = require("through2");
const sed = require("sed-lite").sed;

module.exports = function(file, opts) {
  const filters = opts._.map(function(str) {
    return sed(str);
  });

  // stringify at first
  filters.unshift(String);

  return through.obj(function(row, enc, next) {
    for (const fn of filters) {
      row = fn(row);
    }
    this.push(row);
    next();
  });
};
