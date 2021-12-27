class Category < ApplicationRecord

    acts_as_list

    validates_uniqueness_of :name, message: "Nombre repetido, pon otro nombre"
    validates :name, length: { minimum: 4, message: "Nombre muy corto (mínimo 4 caracteres)" }

    has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
    belongs_to :parent_category, :class_name => "Category", :optional => true
end
