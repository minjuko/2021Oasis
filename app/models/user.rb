class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile
  enum sex: ["남성", "여성"]

  has_many :rides, dependent: :destroy
  has_many :comments, dependent: :destroy
end
