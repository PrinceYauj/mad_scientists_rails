# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      # destroys invention
      class Destroy
        def destroy(params)
          Invention.find(params[:id]).destroy!
        end
      end
    end
  end
end
