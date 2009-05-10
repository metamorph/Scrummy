# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'scrummy'

task :default => 'spec:run'

PROJ.name = 'scrummy'
PROJ.authors = 'Anders Engström'
PROJ.email = 'anders.engstrom@gnejs.net'
PROJ.url = 'http://github.com/metamorph/scrummy'
PROJ.version = Scrummy::VERSION
PROJ.rubyforge.name = 'scrummy'

PROJ.spec.opts << '--color'

# EOF
