class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  with_options allow_blank: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー-]+\z/, message: 'は全角カナで入力してください' }
  end
end
