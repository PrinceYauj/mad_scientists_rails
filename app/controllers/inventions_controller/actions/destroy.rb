# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      class Destroy
        def destroy(params)
          Invention.find(params[:id]).destroy!
        end
      end
    end
  end
end

