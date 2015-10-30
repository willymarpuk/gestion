class Firmante < ActiveRecord::Base
  belongs_to :cuenta_bancaria
  belongs_to :persona

  	validates :persona_id,
		:presence => {
			message: 'Debe seleccionar una persona'}

	validates :cuenta_bancaria,
		:presence => {
			message: 'Debe seleccionar una cuenta bancaria'}
end
