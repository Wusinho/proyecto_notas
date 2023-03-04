class Note < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :body
  validate :date_presence?
  validate :valid_date?, unless: :date_presence?


  def date_presence?
    return if self.note_date.present?

    errors.add(:note_date, "can't be blank")
  end


  def valid_date?
    return unless Time.now > self.note_date

    errors.add(:date, "can't be in the past")
  end
end
