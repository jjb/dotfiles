begin
  
require 'rubygems'
require 'wirble'
require 'ap'

Wirble.init
Wirble.colorize


IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end

class Object
  def m
    (self.public_methods - Object.new.public_methods).sort
  end
end

# print logger to screen (to, for example, view per-command sql generated)
# http://zargony.com/2008/04/28/five-tips-for-developing-rails-applications
# require 'logger'
# if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
#   Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
# end

# require 'irb/completion'
# ARGV.concat [ "--readline", "--prompt-mode", "simple" ]



rescue
  p "Something bad happened while loading .irbrc"
end