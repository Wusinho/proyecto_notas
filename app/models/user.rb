class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes

  def notes_title_ordered
    self.notes.order(:title)
  end

  def notes_date_ordered
    self.notes.order(:note_date)
  end
end
