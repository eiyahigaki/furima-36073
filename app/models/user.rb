class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :en_family, presence: true, format: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :en_first, presence: true, format: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :kana_family, presence: true, format: /\A[ァ-ン]+\z/
  validates :kana_first, presence: true, format: /\A[ァ-ン]+\z/
  validates :birth, presence: true

  VALID＿PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/
  validates :password, format: { with: VALID＿PASSWORD_REGEX }
end
