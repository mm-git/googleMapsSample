#
# User: code house
# Date: 2016/05/12
#
gulp = require('gulp')
browserSync = require('browser-sync').create()
config = require('../config')

gulp.task 'connect', ->
  browserSync.init({
    server:
      baseDir: 'public'
  })

gulp.task 'reload', ->
  browserSync.reload()

gulp.task 'start', ['connect'], ->
  gulp.watch(config.src + '/**/*.coffee', ['coffee'])
  gulp.watch(config.dest + "/**/*", ['reload'])

gulp.task 'start:debug', ['connect'], ->
  gulp.watch(config.src + '/**/*.coffee', ['coffee:debug'])
  gulp.watch(config.dest + "/**/*", ['reload'])
