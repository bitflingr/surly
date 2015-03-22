require 'rake'
#require 'pry'
 
namespace :db do
  
  desc "Migrate the database" 
  task :migrate do
    puts "Migrating database"
    $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
    require 'surly'
    DataMapper.auto_migrate!
  end
 
  desc "Upgrade the database"
  task :upgrade do
    puts "Upgrading the database"
    DataMapper.auto_upgrade!
  end
 
  desc "Populate the database with dummy data by running scripts/applicants.rb"
  task :seed do
    puts "Seeding database"
    require './scripts/applicants.rb'
  end
 
  desc "Migrate and Seed database"
  task :funky => [ "db:migrate", "db:seed" ]
end
