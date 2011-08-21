gems = %w(rubygems irb/completion irb/ext/save-history pp wirble hirb)

gems.each do |gem_name|
  begin
    require gem_name
  rescue LoadError
    STDOUT << "Cannot load #{gem_name.inspect}\n"
  end
end

if defined?(IRB)
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb_history"
  IRB.conf[:PROMPT_MODE]  = :SIMPLE
  IRB.conf[:AUTO_INDENT]  = true
  IRB.conf[:EVAL_HISTORY] = 100
  IRB.conf[:USE_READLINE] = true
end

if defined?(Wirble) 
  Wirble.init
  Wirble.colorize
end

if defined?(Hirb)
  Hirb.enable
  extend Hirb::Console
end

# Log to STDOUT if in Rails
if ENV.include?("RAILS_ENV") && !defined?(RAILS_DEFAULT_LOGGER)
 require "logger"
 RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# Add all gems in the global gemset to the $LOAD_PATH so they can be used in rails3 console with Bundler
if defined?(::Bundler)
  $LOAD_PATH.concat Dir.glob("#{ENV['rvm_ruby_global_gems_path']}/gems/*/lib")
end

IRB.conf[:AUTO_INDENT] = true

# Get all the methods for an object that aren"t basic methods from Object
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# Misc functions

# from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def ls
  %x{ls}.split("\n")
end

def cd(dir)
  Dir.chdir(dir)
  Dir.pwd
end

def pwd
  Dir.pwd
end

def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent)
    else
      puts "No recent file to reload"
    end
  else
    file_name += ".rb" unless file_name =~ /\.rb/
    @recent = file_name
    load "#{file_name}"
  end
end

def copy(str)
  IO.popen("pbcopy", "w") { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

def ep
  eval(paste)
end

# Aliases
alias q exit
