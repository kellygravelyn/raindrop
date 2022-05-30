# Require lib first
Dir[File.join(__dir__, "lib/*.rb")].each {|f| require f}

# Require all generators
Dir[File.join(__dir__, "generators/**/*_generator.rb")].each {|f| require f}

# Run all generators
self.class.constants
  .map {|c| self.class.const_get(c)}
  .select {|c| c.is_a?(Class) && c.included_modules.include?(Generator)}
  .each do |c|
    g = c.new
    puts "Generating theme for #{g.name}"
    g.generate
  end
