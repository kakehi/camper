class CampsController < ApplicationController

    def index
        render 'camps/index'
    end

    before_action :authenticate_user!

    def new
        @camp = Camp.new
        render :new
    end

    def create
        
        @camp = Camp.new(camp_params)

        if params[:camp][:hero_image]
            @camp.image.attach(params[:camp][:hero_image])
        end

        if @camp.save
            redirect_to index_camp_path, notice: '登録しました'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_camp_path
    end

    private
        def camp_params
            params.require(:camp).permit(:name, :description, :hero_image)
        end
end
