class SpicesController < ApplicationController
    def index
        spices = Spice.all 
        render json: spices, except: [:created_at, :updated_at]
    end

    def show
        spice = Spice.find_by(id: params[:id])
        render json: spice
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, except: [:created_at, :updated_at]
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice, except: [:created_at, :updated_at]
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
