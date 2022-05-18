class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  VALID_JNAME_REGEX = /\A(?:[ぁ-んァ-ヶー－]|[ー－]|[一-龠々])+\z/.freeze
                      
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: VALID_JNAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_JNAME_REGEX }
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_day, presence: true
end



