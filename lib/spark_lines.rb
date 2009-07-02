class SparkLines

  def initialize(parameters, project, current_user)
    @parameters = parameters
    @project = project
    @current_user = current_user
  end
    
  def execute
    <<-HTML  
    <script type="text/javascript" src="/macros/spark-line-mingle-macro/javascript/jquery-1.3.2.min.js"></script>	
    <script type="text/javascript" src="/macros/spark-line-mingle-macro/javascript/jquery.sparkline.patched.js"></script>
  	<script type="text/javascript" src="/macros/spark-line-mingle-macro/javascript/mingle.sparkline.js"></script>
    <script type="text/javascript">
      mingle_sparkline.do_spark_line('#{target}', [#{data}], {#{options}});
    </script>  
    HTML
  end
  
  def can_be_cached?
    false  # if appropriate, switch to true once you move your macro to production
  end
  
  def data
    @project.execute_mql(@parameters['query']).collect { |record| record.values.first || 'null' }.join(",")
  end  
  
  def options
    theoptions = (@parameters['options'] || "'type: 'line''").strip
    theoptions[1,theoptions.length-2]
  end
  
  def target
    @parameters['target']
  end
     
end

