class GourmetsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :set_gourmet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @gourmets = Gourmet.all.order('created_at DESC')
  end

  def new
    @gourmet = Gourmet.new
  end

  def create
    @gourmet = Gourmet.new(gourmet_params)
    if @gourmet.valid?
      @gourmet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @gourmet.comments
  end

  def search
    @gourmets = Gourmet.search(params[:keyword])
  end  

  def edit
  end

  def update
    if @gourmet.update(gourmet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    gourmet = Gourmet.find(params[:id])
    gourmet.destroy
    redirect_to root_path
  end

  private

  def gourmet_params
    params.require(:gourmet).permit(:name, :genre_id, :area_id, :menu, :feature, :content, :image,
                                    :user).merge(user_id: current_user.id)
  end

  def set_gourmet
    @gourmet = Gourmet.find(params[:id])
  end

  def contributor_confirmation
    binding.pry
    redirect_to root_path unless current_user.id == @gourmet.user_id
  end
end
