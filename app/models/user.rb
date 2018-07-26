class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :books
         attachment :image

         attachment :profile_image

         validates :name, length: { in: 2..20 }
         validates :introduction, length: { maximum: 50 }

    #      def add_error_sample
    # 	if name.empty?
    #   	errors.add(:introduction, "に関係するエラーを追加")
    #   	errors[:base] << "モデル全体に関係するエラーを追加"
    # 	end
  		# end
end