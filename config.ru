$: << File.join(File.dirname(__FILE__), 'lib')

%w( tmp log db ).each do |dir|
  dir_path = File.join(File.dirname(__FILE__), dir)
  Dir.mkdir(tmpdir) unless File.exist?(dir_path)
end

#tmpdir = File.join(File.dirname(__FILE__), 'tmp')
#ENV['TMPDIR'] = tmpdir
#Dir.mkdir(tmpdir) unless File.exist?(tmpdir)
#logdir = File.join(File.dirname(__FILE__), 'log')
#Dir.mkdir(logdir) unless File.exist?(logdir)
#dbdir = File.join(File.dirname(__FILE__), 'db')
#Dir.mkdir(dbdir) unless File.exist?(dbdir)

require 'bundler/setup'
require 'surly'
#config = YAML.load_file(File.expand_path("../config/thumby.yaml", __FILE__))

run Surly::SinatraApp.new()
