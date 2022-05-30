require 'erb'
require 'fileutils'

module Generator
  GENERATOR_DIR = File.join(__dir__, '..')
  ROOT_DIR = File.join(GENERATOR_DIR, '..')

  def generate
    raise StandardError.new('#generate needs to be overridden!')
  end

  def source_dir
    File.join(GENERATOR_DIR, name)
  end

  def out_dir
    File.join(ROOT_DIR, name)
  end
end
