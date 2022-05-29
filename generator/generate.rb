require_relative 'generator'
require_relative 'color_set'

Dir[File.join(__dir__, "**/*_generator.rb")].each {|file| require file }

self.class.constants
  .map {|c| self.class.const_get(c)}
  .select {|c| c.is_a?(Class) && c.included_modules.include?(Generator)}
  .each {|c| c.new.generate}
