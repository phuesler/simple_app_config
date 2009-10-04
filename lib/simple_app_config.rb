require 'ostruct'
require 'erb'
class AppConfig
  def self.create(yaml_file, options = {})
    yaml_data = YAML::load(ERB.new(IO.read(yaml_file)).result)
    data = {}
    data = yaml_data.delete(options[:environment]) if options[:environment]
    data.merge!(yaml_data)
    OpenStruct.new(data)
  end
end