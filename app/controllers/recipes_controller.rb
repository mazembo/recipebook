class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy] 
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @recipe = Recipe.all.order("created_at DESC")
    #code
  end
  
  def new
    @recipe = current_user.recipes.build 
    #code
  end
  
  def show
    
    #code
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "The recipe has been successfully created"
    else
      render 'new'
      
    end
    
    #code
  end
  
  def edit
    #code
  end
  
  def update
    if @recipe.update(recipe_params)
       redirect_to @recipe, notice: "successfully updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @recipe.destroy
    redirect_to root_path, notice: 'successfully destroyed'
  end
  
  private
   def recipe_params
     params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :steps, :_destroy])  
    #code
   end
  
  def find_recipe
    @recipe = Recipe.find(params[:id])
    #code
  end
end
