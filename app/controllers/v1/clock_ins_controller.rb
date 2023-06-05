class V1::ClockInsController < ApplicationController
	before_action :clock_in_params, only: :create

	def index
		clock_ins = current_user.try(:clock_ins)
		if clock_ins.blank?
			status = :no_content
			message = "Data empty"
		else
			status = :ok
			message = "Data found"
		end
		json_response({ clock_ins: clock_ins }, status, message)
	end

	def create
		clock_in = ClockIn.new(clock_in_params)
    if clock_in.save
      status = :created
      clock_ins = current_user(clock_in_params[:user_id]).clock_ins
    else
      status = :unprocessable_entity
      message = clock_in.errors.full_messages
      clock_ins = []
    end

    json_response({ clock_ins: clock_ins }, status, message)
	end

	private
		def clock_in_params
			params.require(:clock_in).permit(:user_id, :clock_type)
		end
end
