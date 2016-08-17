#
# User: code house
# Date: 2016/08/17
#
gulp = require('gulp')
gulp_webpack = require('gulp-webpack')
webpack = require('webpack')
uglify = require('gulp-uglify')
rename = require('gulp-rename')
plumber = require('gulp-plumber')
config = require('../config')

webpackConfig =
  entry:
    main: config.src + '/main.coffee'
  output:
    filename: '[name].js'
  module:
    loaders: [
      {test: /\.coffee$/, loader: "coffee-loader"}
    ]
  resolve:
    extensions: ['', '.js', '.coffee']
  resolveLoader:
    moduleDirectories: ['../../node_modules']
  plugins:[
    new webpack.ProvidePlugin({
      jQuery: "jquery",
      $: "jquery",
      jquery: "jquery"
      __: "underscore"
      Backbone: "backbone"
    })
  ]
  stats:
    colors: true,
    modules: true,
    reasons: true,
    errorDetails: true

gulp.task 'coffee', ->
  gulp.src(config.src)
  .pipe(plumber({
    errorHandler: (err) ->
      console.log(err.messageFormatted);
      @emit('end')
  }))
  .pipe(gulp_webpack(webpackConfig))
  .pipe(uglify())
  .pipe(rename({
    extname: '.min.js'
  }))
  .pipe(gulp.dest(config.dest + '/js'))

gulp.task 'coffee:debug', ->
  gulp.src(config.src)
  .pipe(plumber({
    errorHandler: (err) ->
      console.log(err.messageFormatted);
      @emit('end')
  }))
  .pipe(gulp_webpack(webpackConfig))
  .pipe(gulp.dest(config.dest + '/js'))
