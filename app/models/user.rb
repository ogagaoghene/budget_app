class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :payments, class_name: 'Payment', foreign_key: 'user_id'
  has_many :categories, class_name: 'Category', foreign_key: 'user_id'

  validates :name, presence: true
end