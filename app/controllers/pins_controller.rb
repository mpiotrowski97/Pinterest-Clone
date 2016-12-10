class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]

	def index
		@pins = Pin.all
	end

	def show

	end

	def new 
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Successfuly created new pin"
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Successfuly edited pin"
		else
			render "edit"
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path, notice: "Successfuly deleted pin"
	end

	private

		def pin_params
			params.require(:pin).permit(:title, :content)
		end

		def find_pin
			@pin = Pin.find(params[:id])
		end
end