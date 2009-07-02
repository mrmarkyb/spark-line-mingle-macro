namespace :macro do |ns|

  task :deploy do
    macro_folder = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    mingle_plugins_folder = File.join(ENV['MINGLE_LOCATION'], 'vendor', 'plugins')
    FileUtils.cp_r(macro_folder, mingle_plugins_folder)
    javascript_folder = File.join(ENV['MINGLE_LOCATION'], 'public', 'macros', File.basename(macro_folder))
    FileUtils.rm_rf(javascript_folder) if File.exists?(javascript_folder)
    FileUtils.mkdir_p(javascript_folder)
    FileUtils.cp_r(File.join(macro_folder, 'javascript'), javascript_folder)
    puts "#{macro_folder} successfully copied over to #{mingle_plugins_folder}. Restart the Mingle server to start using the macro."
  end

end