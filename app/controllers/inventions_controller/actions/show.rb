# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      class Show
        def show(params)
          Invention.find(params[:id])
        end
      end
    end
  end
end
