# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      # returns all scientists
      class Index
        def index
          Scientist.all
        end
      end
    end
  end
end
