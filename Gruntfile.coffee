module.exports = (grunt)->
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    concat:
      app:
        src: ['src/*.js']
        dest: 'meteor/app.js'

      client:
        src: ['src/client/**/*.js']
        dest: 'meteor/client/client.js'

      server:
        src: ['src/server/**/*.js']
        dest: 'meteor/server/server.js'

      options:
        separator: ';'

    ts:
      base:
        src: ['src/**/*.ts']
        options:
          sourceMap: false

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      ts:
        files: ['src/**/*.ts']
        tasks: ['ts', 'concat', 'clean', 'copy']
        options:
          atBegin: true

      css:
        files: ['sass/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

      html:
        files: ['template/**/*.html']
        tasks: ['clean', 'copy']
        options:
          atBegin: true

    clean: ['src/**/*.js', 'meteor/template/**/*.html', 'tscommand.tmp.txt']

    copy:
      template:
        src:  'template/**/*'
        dest: 'meteor/'

  })

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-ts')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', ['ts', 'concat', 'clean', 'copy', 'compass'])
