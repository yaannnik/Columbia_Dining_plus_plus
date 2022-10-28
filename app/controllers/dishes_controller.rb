class DishesController < ApplicationController
    # before_action :force_index_redirect, only: [:index]
  
    def show
      # id = params[:id] # retrieve movie ID from URI route
      # @dish = Dish.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end
  
    def index
      @all_halls = Dish.all_halls
      @dishes = Dish.all
      # @ratings_to_show_hash = ratings_hash
      # @sort_by = sort_by
      # # remember the correct settings for next time
      # session['calories'] = calories
      # session['sort_by'] = @sort_by
    end
  
    def new
      # default: render 'new' template
    end
  
    def create
      @Dish = Dish.create!(dish_params)
      flash[:notice] = "#{@Dish.title} was successfully created."
      redirect_to movies_path
    end
  
    def edit
      # @Dish = Dish.find params[:id]
    end
  
    def update
      # @dish = Dish.find params[:id]
      # @dish.update_attributes!(dish_params)
      # flash[:notice] = "#{@dish.title} was successfully updated."
      # redirect_to movie_path(@dish)
    end
  
    def destroy
      # @dish = Dish.find(params[:id])
      # @dish.destroy
      # flash[:notice] = "Dish '#{@dish.title}' deleted."
      # redirect_to movies_path
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
      params.require(:dish).permit(:name, :hall, :property, :calories)
    end
  end
  