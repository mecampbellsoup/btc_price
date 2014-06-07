require 'rake/testtask'

Rake::TestTask.new :test do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'lib'
  t.libs << 'spec'
  t.verbose = true
end

task default: :test
