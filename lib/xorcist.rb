require 'xorcist/version'

if RUBY_ENGINE == 'jruby'
  require 'java'
  require File.expand_path('../xorcist.jar', __FILE__)
else
  require 'xorcist/xorcist'
end

module Xorcist
  module_function
  def xor(x, y)
    xor!(x.dup, y)
  end

  # rb_str_modify isn't blowing up for frozen strings under Rubinius, so we'll
  # hack in a fix here
  if RUBY_ENGINE == 'rbx'
    alias_method :_xor!, :xor!
    remove_method :xor!
    def xor!(x, y)
      if x.frozen?
        raise(RuntimeError, "can't modify frozen String")
      else
        _xor!(x, y)
      end
    end
  end
end
