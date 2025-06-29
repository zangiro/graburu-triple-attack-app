class User < ApplicationRecord
  authenticates_with_sorcery!
  # sorceryによる認証機能を持たせる

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # if => {}:   「新しいレコード」または「crypted_passwordが変更された」
  # passwordの長さが最低3文字以上であることを要求する

  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # password_confirmationという属性がpasswordと一致することを要求するバリデーション

  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # passwordフィールドの確認（再入力）が必要というバリデーションを追加してる

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 255 }
  validate :agreement
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true


  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  attr_accessor :agree_terms

  def agreement
    if new_record?
      unless agree_terms == "1" || agree_terms == true
        errors.add(:agree_terms, "に同意されてません")
      end
    end
  end
end
