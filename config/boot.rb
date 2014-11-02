# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

# change default port so we can run multiple Rails apps on one computer
# http://stackoverflow.com/questions/3842818/how-to-change-rails-3-server-default-port-in-develoment
require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Port => 3333)
    end
  end
end
