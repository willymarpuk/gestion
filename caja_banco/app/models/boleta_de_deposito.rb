class BoletaDeDeposito < ActiveRecord::Base
  belongs_to :banco
  belongs_to :persona
  belongs_to :cuenta_bancaria
  belongs_to :caja
  has_many :boletas_de_depositos_detalles
  accepts_nested_attributes_for :boletas_de_depositos_detalles, allow_destroy: true

  validates :banco_id, presence: true
  validates :numero, presence: true, numericality: true, length: {maximum: 30}
  validates :persona_id, presence: true
  validates :cuenta_bancaria_id, presence: true
  validates :caja_id, presence: true
  validates :fecha, presence: true
end
