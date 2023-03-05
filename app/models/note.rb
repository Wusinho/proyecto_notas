class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :body, :note_date
  validates_uniqueness_of :title
  validate :valid_date?, unless: :date_presence?


  def date_presence?
    self.note_date.blank?
  end

  def valid_date?
    return unless Date.today > self.note_date

    errors.add(:note_date, "can't be in the past")
  end
end
