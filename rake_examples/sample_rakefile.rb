# Rakefile
#
# usage:
# rake (invokes default)
# rake clean
# rake install (invokes install, which invokes uninstall)
# rake db:backup (invokes backup in db namespace)
task default: [:clean, :build, :install]


task :clean do
    puts "Cleaning packages"
    # `rm *.deb`
end

task :build do
    puts "Building mypackage-0.0.0"
    # `dpkg -b ./mypackage-0.0.0 ./mypackage-0.0.0.deb`
    puts 'Try `rake install` now.'
end

task :uninstall do
    puts 'Uninstalling mypackage'
    # `sudo apt-get remove -y mypackage`
end

# the hash rocket isnt necessary - its just a ruby hash
# these are equivalent:
# task :install => [:uninstall] do
task install: :uninstall do

    puts 'Installing mypackage-0.0.0'
    # `sudo apt-get install -y ./mypackage-0.0.0.deb`
end

namespace :db do
  task :backup do
    puts 'Performing database backup...'
  end
end

namespace :files do
  task :backup do
    puts 'Performing files backup...'
  end
end

task backup_all: ['db:backup', 'files:backup']
task default: :backup_all
