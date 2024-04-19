// config/webpack/environment.js
const { environment } = require('@rails/webpacker');

// Using standard JavaScript array methods to manage file extensions
environment.config.resolve.extensions.unshift('.jsx');  // Adds '.jsx' at the beginning of the array
environment.config.resolve.extensions.push('.js');      // Adds '.js' at the end of the array

// Explicitly setting the entry point for hello_react
environment.config.set('entry.hello_react', './app/javascript/packs/hello_react.jsx');


// Configuring safe defaults for Node.js compatibility features in Webpack 5
environment.config.node = {
    __dirname: 'mock',  // Mock or false, depending on your needs
    __filename: 'mock', // Mock or false, depending on your needs
    global: true        // Polyfill for the global object
};

// Update the loader to include .jsx files
environment.loaders.append('javascript', {
  test: /\.(js|jsx)$/,  // This now includes both .js and .jsx files
  exclude: /node_modules/,
  use: [{
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env']
    }
  }]
});

module.exports = environment;
