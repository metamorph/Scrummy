# The commands used to extract information from a Sprint.
module Scrummy
class Commander

	def initialize(sprint)
		@sprint = sprint
		@handlers = {
			:info => proc{|*args| do_info(*args)}
		}
	end

	def process(input)
		cmd, *args = input
		if handler = @handlers[cmd.to_sym]
			handler.call(args)
		else
			raise "No handler defined for command #{cmd}"
		end
	end

	private

	def do_info(*args)
		puts <<-END
Sprint: #{@sprint.name}
Score: #{@sprint.score}
Focus: #{@sprint.focus_factor}
Goal: #{@sprint.goal}
Participants: #{@sprint.participants.join(", ")}
Schedule: #{@sprint.schedule.first} to #{@sprint.schedule.last} (#{@sprint.schedule.size} days).

Stories:
#{@sprint.stories.map{|s| pp_story(s)}.join("\n=====\n")}
		END
	end

	def pp_story(story)
		<<-END
## #{story.name} ##
#{story.description}
Score: #{story.score}
Tasks:
#{story.tasks.map{|t| pp_task(t)}.join("\n---\n")}
		END
	end

	def pp_task(task)
		<<-END
	[#{task.key}]: #{task.name}
	Score: #{task.score}
	Description: #{task.description}
		END
	end

end

# Path the Sprint class.
class Sprint
	class << self
		alias :orig_define :define

		def define(name, &block)
			commander = Commander.new(orig_define(name, &block))
			commander.process(ARGV)
		end
	end
end

end
