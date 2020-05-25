# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      class Index
        def index
          Invention.all
        end
      end
    end
  end
end
