require 'erb'
require 'fileutils'
require_relative 'color'

BLACK = Color.new('#333333')
WHITE = Color.new('#f5f5f5')
LIGHT_GRAY = Color.new('#b5b5b5')
PURPLE = Color.new('#c4b7d7')
DARK_PURPLE = Color.new('#7f4f9b')
DARK_GRAY_PURPLE = Color.new('#635c6d')
RED = Color.new('#cc5555')
GREEN = Color.new('#65a34c')
YELLOW = Color.new('#bca46d') # More of an orange but 🤷🏻‍♀️
BLUE = Color.new('#5f7acc')
CYAN = Color.new('#91cce0')
SELECTION = Color.new('#c7e3ed')
CURSOR = DARK_GRAY_PURPLE
BACKGROUND = WHITE
FOREGROUND = BLACK

def partial(name, values)
  erb_path = File.join(__dir__, 'templates', '_partials', name + '.erb')
  erb = ERB.new(File.read(erb_path))
  erb.result_with_hash(values)
end

Dir.chdir "#{__dir__}/templates" do
  Dir["**/*.erb"].each do |erb_path|
    next if erb_path.include?('_partials/')

    out_name = erb_path[0...-4]
    out_path = File.absolute_path(File.join(__dir__, '..', out_name))
    puts "Rendering #{erb_path} to #{out_path}"

    erb = ERB.new(File.read(erb_path))
    FileUtils.mkdir_p(File.dirname(out_path))
    File.write(out_path, erb.result(binding))
  end
end
