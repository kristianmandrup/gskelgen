module <%= "#{module_name}" %>
  module Generators           
    <%= embed_template('main_generator.rb', '    ') %>    
  end
end
