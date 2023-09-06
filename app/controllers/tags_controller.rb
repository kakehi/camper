class TagsController < ApplicationController

    def index
        @tag = Tag.all
        render :index
    end

    before_action :authenticate_user!

    def new
        @tag = Tag.new
        render :new
    end

    def create
        @tag = Tag.new(tag_params)

        if params[:tag][:icon_image]
            @tag.icon_image.attach(params[:tag][:icon_image])
        end

        if @tag.save
            redirect_to index_tag_path, notice: 'Created'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @tag = Tag.find(params[:id])
        render :edit
    end
    
    def update
        @tag = Tag.find(params[:id])
        if params[:tag][:hero_image]
            @tag.hero_image.attach(params[:tag][:hero_image])
        end
        if @tag.update(tag_params)
            redirect_to index_tag_path(@tag), notice: 'Tag information is updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to index_tag_path, notice: 'Deleted'
    end

    private
    def tag_params
        params
            .require(:tag)
            .permit(
                :name)
    end

end
