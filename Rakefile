require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.name       = :test
  t.test_files = FileList["test/*.rb"]
end

task :default => :test
