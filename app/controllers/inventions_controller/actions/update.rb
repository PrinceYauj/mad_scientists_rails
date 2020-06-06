# frozen_string_literal: true

module Byg
  module Actions
    module Inventions
      # updates invention with provided parameters (if any)
      # missing parameters are skipped
      # returns updated invention
      class Update
        def update(params)
          old_id = params.delete(:old_id)
          Invention.find(old_id).update!(params)
          if params[:id]
            Invention.find(params[:id])
          else
            Invention.find(old_id)
          end
        end
      end
    end
  end
end
