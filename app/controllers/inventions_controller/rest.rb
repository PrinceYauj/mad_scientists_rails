# frozen_string_literal: true

require_relative 'actions/actions.rb'

module Byg
  module Rest
    module Inventions
      def self.index
        Actions::Inventions::Index.new.index
      end

      def self.create(params)
        Actions::Inventions::Create.new(params).create
      end

      def self.show(params)
        Actions::Inventions::Show.new.show(params)
      end

      def self.update(params)
        Actions::Inventions::Update.new(params).update
      end

      def self.destroy(params)
        Actions::Inventions::Destroy.new.destroy(params)
      end
    end
  end
end
