class GourmetsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_gourmet, only: [:show, :edit, :update]
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
    params.require(:gourmet).permit(:name, :genre_id, :area_id, :menu, :feature, :content, :image, :user).merge(user_id: current_user.id)
  end

  def set_gourmet
    @gourmet = Gourmet.find(params[:id])
  end  

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
