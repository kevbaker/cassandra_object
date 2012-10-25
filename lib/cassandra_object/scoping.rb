module CassandraObject
  module Scoping
    extend ActiveSupport::Concern

    included do
      singleton_class.class_eval do
        delegate :find, :find_by_id, :first, :last, :all, to: :scope
        delegate :find_each, :find_in_batches, to: :scope
        delegate :select, :where, to: :scope
      end
    end

    module ClassMethods
      def scope
        Scope.new(self)
      end
    end
  end
end
