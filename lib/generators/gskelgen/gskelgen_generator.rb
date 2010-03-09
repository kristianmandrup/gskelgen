require 'rails/generators/base'

module Generator
  module Generators
    class Skeleton < Rails::Generators::Base

      argument :gen_name,   :type => :string, :required => true, :banner => 'module:name'      
      class_option :arguments,  :type => :array, :default => [], :banner => "arg:type arg:type", :aliases => "-ARG", :desc => "Generator arguments"
      class_option :options,    :type => :array, :default => [], :banner => "opt:type opt:type", :aliases => "-OPT", :desc => "Generator class options"
      class_option :base_class, :type => :string, :default => "Base", :banner => "Base or Named", :aliases => "-BC", :desc => "Rails Generator class to inherit from"
      class_option :binaries,   :type => :boolean, :default => false, :banner => "Create binaries", :aliases => "-B", :desc => "Include binaries"

      no_tasks do
        attr_accessor :module_name, :name
      end

      def initialize(*args, &block)
        super     
        names = gen_name.split(':')

        if names.size > 1
          @module_name = names[0]
          @name = names[1] 
        else        
          @name = names[0]
        end
      end

      def run_jeweler
        run "jeweler #{name}"
        remove_file "lib/#{name}.rb" # remove lib file        
      end

      def binaries
        empty_directory 'bin'
        inside 'bin' do
          copy_file 'binary.bat', "#{name}.bat"
          copy_file 'binary', "#{name}"
        end
      end

      def create_generators_dir
        empty_directory 'generators'
        inside 'generators' do
          empty_directory "#{name}"
          # template main generator file
          file_name = module_name ? 'module_wrapper' : 'base_generator.rb'
          template file_name, "#{name}/#{name}_generator.rb"             
          empty_directory "#{name}/templates"                           
          copy_file 'templates/sample_template.erb', "#{name}/templates/sample_template.erb.tt"
        end
      end
   
      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} generator:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end
      
    end
  end
end