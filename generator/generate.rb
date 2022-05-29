# Require lib first
Dir[File.join(__dir__, "lib/*.rb")].each {|f| require f}

# Require every other file
Dir[File.join(__dir__, "**/*.rb")].each do |file|
  require file unless file === File.absolute_path(__FILE__)
end

# Run all generators
self.class.constants
  .map {|c| self.class.const_get(c)}
  .select {|c| c.is_a?(Class) && c.included_modules.include?(Generator)}
  .each {|c| c.new.generate}
