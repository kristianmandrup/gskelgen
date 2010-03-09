begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gskelgen"
    gem.summary = %Q{A generator to create a skeleton for a new generator}
    gem.description = %Q{A generator to create a skeleton for a new generator}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/generator_skeleton_gen"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec", ">= 2.0.0"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# require 'rspec/rake_task'
# Rspec::Core::RakeTask.new(:spec) do |spec|
# end

# require 'rspec/rake_task'
# Rspec::Core::RakeTask.new(:rcov) do |spec|
# #  spec.libs << 'lib' << 'spec'
# #  spec.pattern = 'spec/**/*_spec.rb'
# #  spec.rcov = true
# end  

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "generator_skeleton_gen #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
