class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes

  def finder(params)
    if params.keys == %w[controller action]
      notes
    elsif %w[title note_date].include?(params[:sort])
      notes.order(params[:sort])
    else
      query = "%#{params[:search].downcase}%"

      notes.where("title ILIKE :search OR body ILIKE :search", search: query)
    end
  end

end
