class Api::V1::ResidentsController < Api::V1::ApiController

	def index
		user = User.find(params[:user_id])

		residents = user.residents

		render json: residents, root: false
	end

	def show
		resident = Resident.find(params[:id])

		render json: resident, root: false
	end	

end