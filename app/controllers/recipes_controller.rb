class RecipesController < ApplicationController


    def index 
        @recipes = Recipe.all
    end 

    def new 
        @recipe = Recipe.new
    end 

    def edit 
        @recipe = Recipe.find(params[:id])
    end 

    def create 
        @recipe = Recipe.new(article_params)
        if @recipe.save
            flash[:notice] = "Your recipe has been succesfully created!"
            redirect_to recipe_path(@recipe)
        else 
            render 'new'
        end
    end 

    def update 
        @recipe = Recipe.find(params[:id])
        if @recipe.update(article_params)
            flash[:notice] = "Recipe was successfully updated"
            redirect_to recipe_path(@recipe)
        else 
            render 'edit'
        end 
    end 

    def show 
        @recipe = Recipe.find(params[:id])
    end 

    def destroy 
        @recipe = Recipe.find(params[:id])
        @recipe.destroy 
        flash[:notice] = "Recipe was successfully deleted"
        redirect_to recipes_path
    end 

    private
    def article_params 
        params.require(:recipe).permit(:title, :details, :description)
    end 

end 