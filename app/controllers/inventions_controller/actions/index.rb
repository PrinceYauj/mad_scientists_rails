# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      # returns all inventions
      class Index
        def index
          Invention.all
        end
      end
    end
  end
end
