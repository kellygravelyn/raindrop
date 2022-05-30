module Generator
  def generate
    raise StandardError.new('#generate needs to be overridden!')
  end

  def name
    raise StandardError.new('#name needs to be overridden!')
  end

  def out_dir
    File.join(__dir__, '..', '..', name)
  end
end
