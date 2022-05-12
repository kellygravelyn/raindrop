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
LIGHT_BLUE = Color.new('#c9d0d9')
SELECTION = LIGHT_BLUE
CURSOR = DARK_GRAY_PURPLE
BACKGROUND = WHITE
FOREGROUND = BLACK

def partial(name, values)
  erb_path = File.join(__dir__, 'templates', '_partials', name + '.erb')
  erb = ERB.new(File.read(erb_path))
  erb.result_with_hash(values)
end

Dir["#{__dir__}/templates/*.erb"].each do |f|
  out_ext = File.basename(f, '.erb')
  out_path = File.join(__dir__, '..', 'Raindrop.' + out_ext)

  puts "Rendering #{f} to #{out_path}"

  erb = ERB.new(File.read(f))
  File.write(out_path, erb.result(binding))
end

Dir["#{__dir__}/templates/hyper/*.erb"].each do |f|
  out_name = File.basename(f, '.erb')
  out_path = File.join(__dir__, '..', 'hyper', out_name)

  puts "Rendering #{f} to #{out_path}"

  erb = ERB.new(File.read(f))
  FileUtils.mkdir_p(File.dirname(out_path))
  File.write(out_path, erb.result(binding))
end
