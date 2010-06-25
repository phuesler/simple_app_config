require 'test_helper'
class AppConfigTest < Test::Unit::TestCase
  TEST_FILE = File.join(File.dirname(__FILE__),"fixtures","application.yml")

  def test_method_accessor_for_top_level_attributes
    config = AppConfig.create(TEST_FILE)
    assert_equal "RailsConfig", config.application
  end
  
  def test_hash_format
    config = AppConfig.create(TEST_FILE,:format => :hash)
    assert_equal 'RailsConfig', config['application']
  end
  
  def test_read_a_scoped_attribute
    config = AppConfig.create(TEST_FILE, :environment => 'development')
    assert_equal "development_payment_key", config.payment['key']
  end  
  
  def test_read_a_scoped_attribute_in_hash_format
    config = AppConfig.create(TEST_FILE, :environment => 'development', :format => :hash)
    assert_equal "development_payment_key", config['payment']['key']
  end  
  
  def test_read_a_scoped_attribute_in_hash_format
    config = AppConfig.create(TEST_FILE, :environment => 'development', :format => :hash)
    assert_equal "development_payment_key", config['payment']['key']
  end
  
  def test_attributes_are_inherited
    config = AppConfig.create(TEST_FILE, :environment => 'production')
    assert_equal "payment_key", config.payment['key']
  end
  
  def test_attributes_are_inherited_in_hash_format
    config = AppConfig.create(TEST_FILE, :environment => 'production', :format => :hash)
    assert_equal "payment_key", config['payment']['key']
  end
  
  def test_erb_rendering
    config = AppConfig.create(TEST_FILE)
    assert_equal 'VERSION', config.version
  end  
end
