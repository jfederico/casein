begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

desc 'Generate documentation for the Members gem.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Members'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

begin
  APP_RAKEFILE=File.expand_path('../spec/rails_test_app/Rakefile', __FILE__)
  load 'rails/tasks/engine.rake'

  Bundler::GemHelper.install_tasks
  Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each{|f| load f}
  require 'rspec/core'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError => ex
  puts "RSpec tasks were unavailable"
  puts "*** #{ex}"
end

