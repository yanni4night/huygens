module.exports = (grunt) ->
    (require 'time-grunt')(grunt)
    (require 'load-grunt-tasks')(grunt)

    now = new Date
    startYear = 2016
    endYear = ''
    endYear = '-' + now.getFullYear() if startYear < now.getFullYear()

    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        timestamp: (require 'dateformat')(now, 'yyyy-mm-dd HH:MM:ss Z')
        startYear: startYear
        endYear: endYear
        clean:
            min: ['*.dist.js', '*.min.js']
        jshint:
            options:
                jshintrc: '.jshintrc'
            all: ['src/*.js']
        babel:
            options:
                comments: false
                presets: ['babel-preset-es2015']
            es2015:
                src: 'src/huygens.js'
                dest: 'huygens.dist.js'
        uglify:
            options:
                ASCIIOnly: true
                banner: '/*! huygens.min.js Released v<%=pkg.version%> Build <%=timestamp%> | (C) <%=startYear%><%=endYear%> yanni4night.com | github.com/yanni4night/huygens-sdk | MIT */\n'
            dist:
                src: 'huygens.dist.js',
                dest: 'huygens.min.js'
    grunt.registerTask 'default', ['clean', 'jshint', 'babel', 'uglify']