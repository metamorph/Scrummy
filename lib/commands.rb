# The commands used to extract information from a Sprint.
module Scrummy


  # Holds command entries.
  class CommandRepository

    require 'singleton'
    include Singleton

    def register(name, &block)
      mappings[name.to_sym] = block
    end

    def get(name)
      cmd = mappings[name.to_sym]
      unless cmd
        puts "Unknown command: #{name}"
        cmd = self.to_proc
      end
      return cmd
    end

    # Create a proc of ourself.
    # This is the 'help' command.
    def to_proc
      return Proc.new do |*args|
        puts "This is the help command that will display available commands"
      end
    end

    private

    def mappings
      @mappings ||= {}
    end

    # Register the 'help' command.
    instance.register(:help, &CommandRepository.instance)
  end

  # Load all files in 'commands'
  Dir[File.join(File.dirname(__FILE__), "commands", "*.rb")].each do |f|
    require f
  end

  # Patch the Sprint class.
  class Sprint
    class << self
      alias :orig_define :define
      def define(name, &block)
        sprint = orig_define(name, &block)
        # Find and execute the command.
        command_name, *args = ARGV
        command_name = :help unless command_name
        command = CommandRepository.instance.get(command_name)
        command.call(sprint, args)
      end
    end
  end

end
