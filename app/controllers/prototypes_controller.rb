class PrototypesController < ApplicationController
  before_action :move_to_index ,except: [:index,:show]
  def index
   @prototypes = Prototype.all
  end
  def new
    @prototype = Prototype.new
  end
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @prototype = Prototype.find(params[:id])
  end
  def update
    prototype = Prototype.find(params[:id])
   if prototype.update(prototype_params)
    redirect_to root_path
   else
    render :edit
   end
  end
  def show
    @prototype = Prototype.find(params[:id])
    @comment = @prototype.comments.new
    @comments = @prototype.comments.includes(:user)
  end
  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    else
      render :destroy
    end
  end
  private
    def prototype_params
      params.require(:prototype).permit(:image,:title,:consept,:catch_copy).merge(user_id:current_user.id)
    end
    def move_to_index
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
