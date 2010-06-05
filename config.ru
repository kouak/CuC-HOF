# This file is used by Rack-based servers to start the application.

Sass::Plugin.options[:template_location] = { 'app/stylesheets' => 'public/stylesheets' }

require ::File.expand_path('../config/environment',  __FILE__)
run CucHof::Application
