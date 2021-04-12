class PrototypesController < ApplicationController
  before_action :authenticate_user! ,except: [:index,:show]
  before_action :not_current_user,except:[:index,:show,:new,:create]
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
    @prototype = Prototype.find(params[:id])
   if @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype.id)
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
    def not_current_user
      @prototype = Prototype.find(params[:id])
      if @prototype.user != current_user
        redirect_to root_path
      end
    end
end
