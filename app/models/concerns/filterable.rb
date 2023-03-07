# frozen_string_literal: true
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, user = nil)
      results = self.where(nil)
      results = results.where(user: user) if self.method_defined?(:user)
      filtering_params.each do |key, value|
        results = results.public_send("filter_#{key}", value) if value.present?
      end
      results
    end
  end
end
