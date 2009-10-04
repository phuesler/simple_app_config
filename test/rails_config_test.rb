require 'test_helper'
class RailsConfigTest < Test::Unit::TestCase
  TEST_FILE = File.join(File.dirname(__FILE__),"fixtures","application.yml")

  def test_method_accessor_for_top_level_attributes
    config = ApplicationConfig.create(TEST_FILE, :environment => 'development')
    assert_equal "RailsConfig", config.application
  end

  def test_read_a_scoped_attribute
    config = ApplicationConfig.create(TEST_FILE, :environment => 'development')
    assert_equal "development_payment_key", config.payment['key']
  end
  
  def test_attributes_are_inherited
    config = ApplicationConfig.create(TEST_FILE, :environment => 'production')
    assert_equal "payment_key", config.payment['key']
  end  
end
