class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable


  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :identities, dependent: :destroy
end
