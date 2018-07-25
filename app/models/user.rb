class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :books
         attachment :image

         attachment :profile_image

         validates :name, length: { in: 2..20 }
         validates :introduction, length: { in: 0..50 }
end
