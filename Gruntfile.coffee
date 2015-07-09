module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig(
    # Metadata	
    pkg: grunt.file.readJSON('package.json')
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'		
      build:
        src: 'src/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'
    coffee:
      compileJoined:
        #options:
          # join: true        
        files:          
          'build/<%= pkg.name %>.js': [
            'src/*.coffee'
            'src/pck/*.coffee'
          ] # concat then compile into single file
  )
	
  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # Default task(s).
  grunt.registerTask 'default', ['coffee']
