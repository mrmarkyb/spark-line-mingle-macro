namespace :macro do |ns|

  task :deploy => :rollback do
    FileUtils.cp_r(macro_folder, mingle_plugins_folder) if not File.identical?(deployed_macro_folder, macro_folder)
    FileUtils.mkdir_p(deployed_javascript_folder)
    FileUtils.cp_r(local_javascript_folder, deployed_javascript_folder)
    puts "#{macro_folder} copied over to #{deployed_macro_folder}. #{local_javascript_folder} copied over to #{deployed_javascript_folder}. Restart the Mingle server to start using the macro."
  end
  
  task :rollback do
    FileUtils.rm_rf(deployed_macro_folder) if File.exists?(deployed_macro_folder) and not File.identical?(deployed_macro_folder, macro_folder)
    FileUtils.rm_rf(deployed_javascript_folder) if File.exists?(deployed_javascript_folder)    
    puts "#{deployed_macro_folder} and #{deployed_javascript_folder} successfully removed. Restart the Mingle server to ensure the macro is removed."
  end
  
  def macro_folder
    File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end

  def mingle_plugins_folder
    File.join(ENV['MINGLE_LOCATION'], 'vendor', 'plugins')
  end
  
  def deployed_macro_folder
    File.join(ENV['MINGLE_LOCATION'], 'vendor', 'plugins', File.basename(macro_folder))
  end
  
  def local_javascript_folder
    File.join(macro_folder, 'javascript')
  end
    
  def deployed_javascript_folder
    File.join(ENV['MINGLE_LOCATION'], 'public', 'macros', File.basename(macro_folder))
  end
  
end