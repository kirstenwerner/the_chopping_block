class RecipesController < ApplicationController
    before_action :set_recipe, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index 
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
    end 

    def new 
        @recipe = Recipe.new
    end 

    def edit 
    end 

    def create 
        @recipe = Recipe.new(article_params)
        @recipe.user = User.first
        if @recipe.save
            flash[:success] = "Your recipe has been succesfully created!"
            redirect_to recipe_path(@recipe)
        else 
            render 'new'
        end
    end 

    def update 
        if @recipe.update(article_params)
            flash[:success] = "Recipe was successfully updated"
            redirect_to recipe_path(@recipe)
        else 
            render 'edit'
        end 
    end 

    def show 
    end 

    def destroy 
        @recipe.destroy 
        flash[:danger] = "Recipe was successfully deleted"
        redirect_to recipes_path
    end 

    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end 

    def article_params 
        params.require(:recipe).permit(:title, :details, :description)
    end 

    def require_same_user 
        if current_user != @recipe.user 
            flash[:danger] = "You can only edit or delete your own recipes"
            redirect_to root_path 
        end 
    end
end 