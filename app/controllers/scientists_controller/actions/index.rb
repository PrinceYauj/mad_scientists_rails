# frozen_string_literal: true

module Byg
  module Actions
    module Scientists
      class Index
        def index
          Scientist.all
        end
      end
    end
  end
end
