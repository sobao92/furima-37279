class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, allow_blank: true }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
