class Category < ApplicationRecord
    has_many :subcategories
    validates :title, presence: true
end
