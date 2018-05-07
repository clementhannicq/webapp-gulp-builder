plumber       = require 'gulp-plumber'
revReplace    = require 'gulp-rev-replace'

module.exports = (gulp, config) ->
  gulp.task 'replace', ->
    return if config.output.disable_cache_busting
    manifest = gulp.src(config.output.path + '/rev-manifest.json')
    gulp.src config.output.path + '/index.html'
      .pipe plumber()
      .pipe(revReplace({manifest: manifest}))
      .pipe gulp.dest config.output.path
