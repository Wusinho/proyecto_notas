# frozen_string_literal: true
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, user = nil)
      results = where(nil)
      results = results.where(user:) if method_defined?(:user)

      key = filtering_params.keys.first
      value = filtering_params.values.first
      if value.present?
        results.public_send("filter_#{key}", value)
      else
        results.order(created_at: :desc)
      end
    end
  end
end
