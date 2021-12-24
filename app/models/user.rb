class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :en_family, presence: true
  validates :en_first, presence: true
  validates :kana_family, presence: true
  validates :kana_first, presence: true
  validates :birth, presence: true

  VALID＿PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID＿PASSWORD_REGEX }
end
