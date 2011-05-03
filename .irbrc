begin
  
require 'rubygems'
require 'wirble'
require 'ap'
require 'irbcp'

Wirble.init
Wirble.colorize

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

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
#   Object.send(:remove_const, :RAILS_DEFAULT_LOGGER) 
#   Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
# end

# require 'irb/completion'
# ARGV.concat [ "--readline", "--prompt-mode", "simple" ]



rescue Exception => e
  p ".irbrc did not load, for the following reason: #{e.message}"
end