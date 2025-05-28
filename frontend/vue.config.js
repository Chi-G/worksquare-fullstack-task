const path = require('path')

module.exports = {
  transpileDependencies: true,
  publicPath: '/',
  configureWebpack: {
    resolve: {
      alias: {
        '@': path.resolve(__dirname, 'src'),
        'public': path.resolve(__dirname, 'public')
      }
    },
    externals: {
      'tiny-slider': 'tns',
      'swiper': 'Swiper',
      'choices.js': 'Choices',
      'gumshoejs': 'Gumshoe',
      'tobii': 'Tobii'
    }
  },
  chainWebpack: config => {
    config.module
      .rule('js')
      .exclude
      .add(/public\/assets\/libs/)
      .end()
  }
}
