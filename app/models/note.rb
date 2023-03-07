# frozen_string_literal: true

class Note < ApplicationRecord
  include Filterable
  belongs_to :user
  validates_presence_of :title, :body, :note_date
  validate :valid_date?, unless: :date_presence?
  belongs_to :author, foreign_key: :user_id, class_name: 'User'


  scope :filter_sort_by_name, ->(value) { order("#{value} ASC") }
  scope :filter_search, ->(value) { where( "title ILIKE :search OR body ILIKE :search", search: "%#{value.downcase}%") }

  def date_presence?
    note_date.blank?
  end

  def valid_date?
    return unless Date.today > note_date

    errors.add(:note_date, "can't be in the past")
  end
end
