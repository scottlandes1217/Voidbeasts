// config/webpack/production.js
const environment = require('./environment');

module.exports = environment.toWebpackConfig();