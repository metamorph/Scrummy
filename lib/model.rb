require 'date'

# The model.
module Scrummy
class Sprint

	class Builder
		def initialize(name)
			@sprint = Sprint.new(name)
		end
		def build(&block)
			instance_eval &block
			return @sprint
		end

		#
		# Setup the sprint schedule.
		# All dates are specified as strings, and will be parsed by +Date.parse+.
		# +start_date+ defines the beginning of the sprint.
		# +end_date+ defines the last date of the sprint and must be a date after +start_date+.
		# +options+ can be:
		# :exclude_weekends - true or false (default: true). This will exclude Saturdays and Sundays from the schema.
		# :exclude_date - an array of dates that should be exluded from the sprint schedule.
		#
		def schedule(start_date, end_date, options = {})
			dates = (Date.parse(start_date)...Date.parse(end_date)).to_a
			if options[:exclude_weekends]
				dates.delete_if do |d|
					d.wday == 0 || d.wday == 6
				end
			end
			if excludes = options[:exclude_dates]
				dates -= excludes.map {|d| Date.parse(d)}	
			end
			@sprint.schedule = dates
		end

		# Sets the Sprint goal.
		def goal(desc)
			@sprint.goal = desc.to_s.strip
		end

		# Set the participants of the sprint.
		def participants(*vals)
			@sprint.participants = Array(vals).map{|v| v.to_sym}
		end

		# Define a story for the sprint.
		def story(name, &block)
			@sprint.stories << Story::Builder.new(name).build(&block)
		end

	end

	# Creates a sprint from DSL
	def self.define(name, &block)
		$the_sprint = Builder.new(name).build(&block)
	end

	attr_accessor :name, :goal, :participants, :schedule
	attr_accessor :stories

	def initialize(name)
		@name = name
		@participants = []
		@schedule = []
		@stories = []
	end

	# Aggregated score.
	def score
		@stories.inject(0){|m, s| m += s.score }
	end

	def focus_factor
		score / schedule.size.to_f
	end

end

class Story

	class Builder
		def initialize(name)
			@story = Story.new(name)
		end
		def build(&block)
			instance_eval &block
			return @story
		end
		def description(value)
			@story.description = value.to_s.strip
		end

		def task(key, name, &block)
			# NOTE: Not the standard pattern..
			Task::Builder.new(@story.create_task(key, name)).build(&block)
		end
	end
	
	attr_accessor :name, :description
	attr_accessor :tasks

	def initialize(name)
		@name = name
		@tasks = []
	end

	# Aggregated score
	def score
		@tasks.inject(0){|m,t| m += t.score}
	end

	def create_task(key, name)
		# TODO: Check that the key is unique.
		(@tasks << Task.new(key, name)).last
	end
end

class Task

	class Builder
		def initialize(task)
			@task = task
		end
		def build(&block)
			instance_eval &block
			@task
		end
		def description(value)
			@task.description = value.to_s.strip
		end
		def score(value)
			@task.score = value.to_f
		end
	end

	attr_accessor :name, :key, :score, :description

	def initialize(key, name)
		@key, @name = key, name
		@score = 0
	end

end


end
