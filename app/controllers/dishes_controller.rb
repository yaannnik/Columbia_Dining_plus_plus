class DishesController < ApplicationController
  # before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @dish = Dish.find(id) # look up movie by unique ID
    # will render app/views/dishes/show.<extension> by default
  end

  def index
    # @dishes = Dish.with_filter(@hall_filter, sort_by)
    # @dishes = Dish.with_orders(sort_by)
    @all_halls = Dish.all_halls
    # @ratings_to_show_hash = ratings_hash
    @hall_filter = params[:cur_hall] || session[:cur_hall]
    @sort_by = params[:sort_by] || session[:sort_by]

    if params[:sort_by] != session[:sort_by]
      session[:sort_by] = @sort_by
      redirect_to :sort_by => @sort_by, :cur_hall => @hall_filter
      return
    end
    
    if params[:cur_hall] != session[:cur_hall] 
      session[:sort_by] = @sort_by
      session[:cur_hall] = @hall_filter 
      redirect_to :sort_by => @sort_by, :cur_hall => @hall_filter
      return
    end

    @dishes = Dish.with_filter(@hall_filter, @sort_by)
    # @dishes = Dish.all(:order => sort_by)
  end

  def new
    # default: render 'new' template
  end

  def create
    if dish_params[:calories] > "0"
      @dish = Dish.create!(dish_params)
      flash[:notice] = "#{@dish.name} was successfully created."
      redirect_to dishes_path
    else
      flash[:notice] = "The calory value is invalid."
      redirect_to new_dish_path
    end
  end

  def edit
    @dish = Dish.find params[:id]
  end

  def update
    @dish = Dish.find(params[:id])
    if dish_params[:calories] > "0"
      @dish.update_attributes!(dish_params)
      flash[:notice] = "#{@dish.name} was successfully updated."
      redirect_to dish_path(@dish)
    else
      flash[:notice] = "The calory value is invalid."
      redirect_to dish_path(@dish)
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    flash[:notice] = "Dish '#{@dish.name}' deleted."
    redirect_to dishes_path
  end

  # def force_index_redirect
  #   if 0
  #     flash.keep
  #     url = dishes_path()
  #     redirect_to url
  #   end
  # end

  def hall
    return Dish.all_halls
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def dish_params
    params.require(:dish).permit(:name, :hall, :property, :calories, :image)
  end

  def sort_by
    params[:sort_by]|| 'id' || session[:sort_by]
  end
end

