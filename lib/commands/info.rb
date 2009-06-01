

class Info

TMPL = <<-END
== <%= sprint.name %> ==

  <%= sprint.goal %>

Duration: <%= sprint.schedule.first %> - <%= sprint.schedule.last %>, <%= sprint.schedule.size %> days
Participants: <%= sprint.participants.join(', ') %>
Points: <%= sprint.score %>
Focus Factor: <%= sprint.focus_factor %>

Stories:
  <% for story in sprint.stories %>+ <%= story.name %>, <%= story.score %> points <% if verbose? %>
    <% for task in story.tasks %>- <%= task.name %>, <%= task.score %> points
    <% end %>
    <% end %>
  <% end %>
END


  attr_reader :sprint
  
  def initialize(sprint)
    @sprint = sprint

  end

  def verbose?
    return @verbose
  end

  def run(*args)
    require 'erb'
    @verbose = args.flatten.first == "-v"
    puts ERB.new(TMPL).result(binding)
  end

end
# Register
Scrummy::CommandRepository.instance.register(:info) do |sprint, *args|
  Info.new(sprint).run(args)
end


