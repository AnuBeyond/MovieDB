class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  has_many :movies, dependent: :destroy

  def parent_name
    parent.try(:name)
  end
end
