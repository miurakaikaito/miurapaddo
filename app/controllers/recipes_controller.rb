class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    Recipe.create(recipe_params)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:text1, :text2, :text3, :text4, :text5)
  end
end
