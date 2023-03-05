class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes

  def finder(str)
    %w[title note_date].include?(str) ? order_by_name(str) : search_by_title_body(str)
  end

  def order_by_name(name)
    notes.order("#{name} ASC")
  end

  def search_by_title_body(query)
    query = "%#{query.downcase}%"

    notes.where("title ILIKE :search OR body ILIKE :search", search: query)
  end

end
