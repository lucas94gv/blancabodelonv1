class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
    validates :position, presence: true, numericality: { only_integer: true }, uniqueness: true
end
