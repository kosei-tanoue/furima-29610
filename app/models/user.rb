class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, :first_name, :last_name, :first_reading, :last_reading, :birthday, presence: true

  with_options presence: true do
    validates :nickname, :birthday
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_reading, :last_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
