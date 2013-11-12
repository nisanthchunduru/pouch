path = require 'path'
matchdep = require 'matchdep'

sassDir = path.join 'app', 'stylesheets'
sassFiles = path.join sassDir, '**', '*.sass'

coffeeDir = path.join 'app', 'javascripts'
coffeePattern = path.join '**', '*.coffee'
coffeeFiles = path.join coffeeDir, coffeePattern

module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    compass:
      development:
        options:
          sassDir: sassDir
          cssDir: path.join 'assets', 'stylesheets', 'compiled'
          # fontsDir: path.join '..', '..', '..', 'fonts'
          fontsDir: 'fonts'
          outputStyle: 'expanded'

    coffee:
      development:
        expand: true
        cwd: coffeeDir
        src: [coffeePattern]
        dest: path.join 'assets', 'javascripts', 'compiled'
        ext: '.js'

    watch:
      compass:
        files: [sassFiles]
        tasks: ['compass:development']
      coffee:
        files: [coffeeFiles]
        tasks: ['coffee:development']

  (matchdep.filterAll 'grunt-contrib-*').map grunt.loadNpmTasks

  grunt.registerTask 'default', ['compass:development', 'coffee:development']
  