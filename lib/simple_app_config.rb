require 'ostruct'
require 'erb'
require 'YAML' unless defined?(YAML)
class AppConfig
  def self.create(yaml_file, options = {})
    format = options[:format] || :struct
    yaml_data = YAML::load(ERB.new(IO.read(yaml_file)).result)
    data = {}
    data = yaml_data.delete(options[:environment]) if options[:environment]
    data.merge!(yaml_data)
    format == :struct ? OpenStruct.new(data) : data
  end
end