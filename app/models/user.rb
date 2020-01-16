class User < ApplicationRecord

  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :uniqueness => true, :presence => true

  has_many:opinions, dependent: :destroy
  has_many:likes, dependent: :destroy
  has_many:liked_opinions, through: :likes, source: :opinion
       
  def already_liked?(opinion)
    self.likes.exists?(opinion_id: opinion.id)
  end  
  
end
