class Category < ApplicationRecord
    validates_uniqueness_of :name, message: "ERROR. Nombre repetido, pon otro nombre"
    validates_uniqueness_of :position, message: "ERROR. Esa posición está ocupada, escoge otra"
    validates :name, length: { minimum: 4, message: "ERROR. Nombre muy corto (mínimo 4 caracteres)" }
end
