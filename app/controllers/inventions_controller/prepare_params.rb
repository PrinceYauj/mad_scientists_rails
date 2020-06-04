# frozen_string_literal: true

module Byg
  module Support
    module Inventions
      def prepare_create(params)
        res = params.permit!.to_hash['invention'].symbolize_keys
                    .slice(:name, :power, :scientist_id).delete_if { |_, v| v.blank? }
        res[:name] ||= 'Chuck Norris'
        res[:power] ||= 9000
        res
      end

      def prepare_update(params)
        res = params.permit!.to_hash['invention'].symbolize_keys
                    .slice(:name, :power, :scientist_id).delete_if { |_, v| v.blank? }
        res[:id] = params[:id]
        res
      end
    end
  end
end
