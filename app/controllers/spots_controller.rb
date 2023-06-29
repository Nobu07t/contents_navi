class SpotsController < ApplicationController
  before_action :set_spot, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    if params[:genre_id].to_i > 1
     @spots = Spot.where(genre_id: params[:genre_id]).order("created_at DESC")
    
    else
     @spots = Spot.includes(:user).order("created_at DESC")
    end
  end

  def new
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @spot.comments
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


private

  def spot_params
    params.require(:spot).permit(:genre_id, :title, :catch_copy, :postal_code, :prefecture_id, :city, :addresses, :image).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @spot.user
  end
end
