require 'erb'
# Required for rendering with hash object
require 'ostruct'

class RegisterDashboard
  attr_accessor :items, :template, :date

  def initialize(output, host, template)
    @output = 'output/' + output + '-register.json'
    @host = host
    @template = File.read(template)
  end

  def render()
    ERB.new(@template).result(binding)
  end

  def save()
    puts @output
    File.open(@output, 'w+') do |f|
      f.write(render())
    end
  end

end

class RegisterFromHash
  attr_accessor :items, :template, :date

  def initialize(output, data, template)
    @output = 'output/' + output + '-register.json'
    @data = data
    @template = File.read(template)
  end

  def render()
    ERB.new(@template).result(OpenStruct.new(@data).instance_eval { binding })
  end

  def save()
    File.open(@output, 'w+') do |f|
      f.write(render())
    end
  end

end
