module Scrummy

  class Sprint

    attr_reader :name

    def initialize(name)
      @name = name.to_s
    end

  end

end

