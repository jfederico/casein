require "members"
require "rails"
require 'bootstrap-sass'

module Members
  class Engine < Rails::Engine
    
    initializer "members.assets.precompile" do |app|
      app.config.assets.precompile += %w(members/login.css members/members.css members/members.js members/html5shiv.js members/custom.css members/custom.js members/*.png)
    end

    rake_tasks do
      load "railties/tasks.rake"
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
      
  end
  
  class RouteConstraint

     def matches?(request)
       return false if request.fullpath.include?("/members")
       return false if request.fullpath.include?("/admin")
       true
     end

   end
end
