class Api::V1::ResidentsController < Api::V1::ApiController

	def index
		user = current_user

		residents = user.residents

		render json: residents, root: false
	end

end