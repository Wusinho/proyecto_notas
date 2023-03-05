class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes

  def finder(text)
    query = "%#{text.downcase}%"
    notes.where("title ILIKE :search OR body ILIKE :search", search: query)
  end

end
