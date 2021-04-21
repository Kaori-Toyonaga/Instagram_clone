class User < ApplicationRecord
  validates :name, presence: true, on: :create
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, on: :create
  validates :email, uniqueness: true, on: :create
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
