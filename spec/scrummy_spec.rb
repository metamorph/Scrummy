
require File.join(File.dirname(__FILE__), %w[spec_helper])

include Scrummy

describe Sprint do


    it "should require a name" do
      # Check expected usage.
      proc { 
        s = Sprint.new("Name")
        s.name.should eql("Name")
      }.should_not raise_error

      # Check that an argument is required to create the sprint.
      proc { Sprint.new  }.should raise_error(ArgumentError)
    end

    it "should convert the name to a String" do
      Sprint.new(11).name.should eql("11")
    end



end

# EOF
