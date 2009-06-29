require File.join(File.dirname(__FILE__), 'unit_test_helper')

class SparkLinesTest < Test::Unit::TestCase
  
  FIXTURE = 'sample'
  
  def test_macro_contents
    spark_lines = SparkLines.new(nil, project(FIXTURE), nil)
    result = spark_lines.execute
    assert result
  end

end