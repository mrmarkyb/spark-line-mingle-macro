class SparkLines

  def initialize(parameters, project, current_user)
    @parameters = parameters
    @project = project
    @current_user = current_user
  end
    
  def execute
    <<-HTML
    <span class='sparkline'>#{data}</span>    
    <script type="text/javascript">
    function loadJsFile(filename) {
      var fileref=document.createElement('script');
      fileref.setAttribute("type","text/javascript");
      fileref.setAttribute("src", filename);
      document.getElementsByTagName("head")[0].appendChild(fileref);
    }    
    loadJsFile('http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js');
    loadJsFile('http://omnipotent.net/jquery.sparkline/1.4.2/jquery.sparkline.min.js');
    </script> 
    <script type="text/javascript">
    $('.sparkline').sparkline();
    </script>  
    HTML
  end
  
  def can_be_cached?
    false  # if appropriate, switch to true once you move your macro to production
  end
  
  def data
    @project.execute_mql(@parameters['query']).collect { |record| record.values.first }.join(",")
  end  
     
end

