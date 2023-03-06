# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :body, :note_date
  validate :valid_date?, unless: :date_presence?

  def date_presence?
    note_date.blank?
  end

  def valid_date?
    return unless Date.today > note_date

    errors.add(:note_date, "can't be in the past")
  end
end
