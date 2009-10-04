require 'ostruct'
class ApplicationConfig
  def self.create(yaml_file, options = {})
    yaml_data = YAML::load_file(yaml_file)
    data = {}
    data = yaml_data.delete(options[:environment]) if options[:environment]
    data.merge!(yaml_data)
    OpenStruct.new(data)
  end
end