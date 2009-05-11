require 'lib/model.rb'
require 'lib/commands.rb'

Scrummy::Sprint.define "09:06" do

	schedule "2009-05-04", "2009-05-29", 
		:exclude_weekends => true, 
		:exclude_dates => %w(2009-05-21 2009-05-22)

	goal "To be able to start developing flash game on the new GDK 2.0"

	participants :engand, :erifre, :norhel

	story "Flash Client GDK" do
		description <<-END
			The actual description of the story... some details
			that might be interesting.
		END

		task :flash_codegen, "Annotation-based code generation" do
			description "Dflksfdj kjdh fksdfk G"
			score 3
		end

		task :flash_services, "Full Service support" do
			description "Expose all services in the Flash API"
			score 2
		end
	end

	story "Blaze Module :: General" do
		description "Unclassified tasks for the Blaze module"

		task :blaze_threads, "Thread Safety" do
			score 2
		end
	end

end
