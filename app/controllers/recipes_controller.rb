class RecipesController < ApplicationController

    def new 
        @recipe = Recipe.new
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

    def show 
        @recipe = Recipe.find(params[:id])
    end 

    private
    def article_params 
        params.require(:recipe).permit(:title, :details, :description)
    end 

end 