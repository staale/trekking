sysPath = require 'path'
fs = require 'fs'

exports.config =
  # See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/main.js': /^app/
        'javascripts/dependencies.js': /^(vendor|bower_components)/

    stylesheets:
      joinTo:
        'stylesheets/main.css': /^(app|vendor)/

    templates:
      precompile: true
      root: 'templates'
      joinTo: 'javascripts/main.js' : /^app/

  conventions:
    assets: /(assets|fonts)/