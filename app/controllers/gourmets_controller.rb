class GourmetsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_gourmet, only: [:show]
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
  end  

  private

  def gourmet_params
    params.require(:gourmet).permit(:name, :genre_id, :area_id, :menu, :feature, :content, :image, :user).merge(user_id: current_user.id)
  end

  def set_gourmet
    @gourmet = Gourmet.find(params[:id])
  end  

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
