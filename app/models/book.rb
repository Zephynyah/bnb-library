# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :text
#  price       :float
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
