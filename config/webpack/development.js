process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = {
  entry: {
    main: './app/javascript/packs/application.js'
  },
  resolve: {
    extensions: ['.js', '.jsx']
  }
}