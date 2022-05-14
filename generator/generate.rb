require 'erb'
require 'fileutils'
require_relative 'color'

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
