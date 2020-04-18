class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_one_attached :avatar

  validates :username,
            presence: true,
            format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i },
            uniqueness: { case_sensitive: false }
end
