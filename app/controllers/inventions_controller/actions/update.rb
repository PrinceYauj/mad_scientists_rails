# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      class Update
        def update(params)
          Invention.find(params[:id]).update!(params)
          Invention.find(params[:id])
        end
      end
    end
  end
end
