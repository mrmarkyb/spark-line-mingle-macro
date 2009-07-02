require File.join(File.dirname(__FILE__), 'unit_test_helper')

class SparkLinesTest < Test::Unit::TestCase
  
  FIXTURE = 'sample'
  
  def test_options_are_cleaned
    spark_lines = SparkLines.new({'options' => "'composite: true'    "}, project(FIXTURE), nil)
    assert_equal('composite: true', spark_lines.options)
  end

  def test_options_are_defaulted
    spark_lines = SparkLines.new({}, project(FIXTURE), nil)
    assert_equal("type: 'line'", spark_lines.options)
  end

end