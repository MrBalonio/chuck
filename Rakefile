# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "chuck"
  gem.homepage = "http://github.com/mstahl/chuck"
  gem.license = "MIT"
  gem.summary = %Q{Gem for interacting with the Internet Chuck Norris Database.}
  gem.description = %Q{Use this gem to retrieve jokes from the Internet Chuck Norris Database, with a variety of options and object-oriented excellence, for the people. http://www.icndb.com/}
  gem.email = "max@villainousindustries.com"
  gem.authors = ["max thom stahl"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
