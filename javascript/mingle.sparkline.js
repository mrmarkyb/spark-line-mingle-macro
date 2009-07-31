var mingle_sparkline = {};
mingle_sparkline.do_spark_line = function(span_id, data, options) {
	    if(!document.getElementById(span_id)) {  
	      document.write("<span id='" + span_id + "'></span>")
	    }	  	
	    jQuery(function() {
		  jQuery('#'+span_id).sparkline(data,options);
		});
};
