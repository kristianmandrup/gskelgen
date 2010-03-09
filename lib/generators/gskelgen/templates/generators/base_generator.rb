class Skeleton < Rails::Generators::<%= "#{base_class}"%>
  
  <% arguments.each do |arg| %>    
    argument :<%= "#{arg.name},   :type => :#{arg.type}, :required => #{arg.req}", :banner => 'none'
  <% end %>      

  <% options.each do |opt| %>    
    class_option :<%= "#{opt.name},   :type => :#{opt.type}"
      <%= ",:banner => 'none', :desc => 'none' "%><%= ", :default => []" if arg.default? %>
  <% end %>      


  def initialize(*args, &block)
    super
  end

  def first
    # run ' '
    # remove_file 
    # empty_directory
    # inside 'generators' do    
      # template ' ', ""
      # copy_file ' '
    # end
  end

  no_tasks do 
    def helper      
    end        
  end

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def self.banner
    "\#{$0} #{gen_name}:\#{generator_name} \#{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
  end
  
end