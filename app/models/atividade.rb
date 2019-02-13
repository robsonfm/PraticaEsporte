class Atividade < ApplicationRecord

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
	validates_presence_of :tipoatividade, message: 'Campo não pode ser deixado em branco.'
	validates_presence_of :titulo, message: 'Campo não pode ser deixado em branco.'
	validates_presence_of :data, message: 'Campo não pode ser deixado em branco.'
	validates_presence_of :foto, message: 'Uma imagem deve ser anexada.'
	validates :duracao, numericality: {greater_than: 0}
	validate :data_atual
	validate :restricoes

	def data_atual
		if !(data == Date.today)
			errors.add(:data, "A data deve ser a atual")
		end 
	end

	def restricoes
		if (tipoatividade == 'Bicicleta')
			if(duracao < 45)
				errors.add(:duracao, "A duração para a atividade Bicicleta deve ser maior do que 45 minutos")
			end
		end
		if (tipoatividade == 'Natação')
			if(duracao < 30)
				errors.add(:duracao, "A duração para a atividade Natação deve ser maior do que 30 minutos")
			end
		end
		if (tipoatividade == 'Corrida')
			if(duracao < 40)
				errors.add(:duracao, "A duração para a atividade Corrida deve ser maior do que 40 minutos")
			end
		end
	end

end
