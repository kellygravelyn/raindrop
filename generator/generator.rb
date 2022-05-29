require 'erb'
require 'fileutils'

module Generator
  def generate
    Dir.chdir(File.join(__dir__, name)) do
      Dir["*.erb"].each do |erb_path|
        next if erb_path.include?('_partials/')

        out_file = erb_path[0...-4]
        out_path = File.absolute_path(File.join(__dir__, '..', name, out_file))
        puts "Rendering #{erb_path} to #{out_path}"

        FileUtils.mkdir_p(File.dirname(out_path))

        erb = ERB.new(File.read(erb_path), trim_mode: '<>')
        File.write(out_path, erb.result(binding))
      end
    end
  end

  def partial(partial_name, values)
    erb_path = File.join('_partials', partial_name + '.erb')
    erb = ERB.new(File.read(erb_path), trim_mode: '<>')
    erb.result_with_hash(values)
  end
end
