class User < ApplicationRecord

  has_many:opinions, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :uniqueness => true, :presence => true

    
       
      
  
end
