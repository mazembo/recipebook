require 'rails_helper'

describe "Recipe" do
  it "should save a valid record" do
    @recipe = Recipe.new
    @recipe.description = "bla bla bla"
    @recipe.image_file_name = "recipe.jpg"
    @recipe.title = "yaourt"
    @recipe.save
    expect(@recipe) .to be_valid
  end
  it "should validate presence of title" do
    @recipe = Recipe.new
    @recipe.description = "bla bla bla"
    @recipe.image_file_name = "recipe.jpg"
    @recipe.save
    expect(@recipe) .not_to be_valid
  end
  
  it "should validate presence of description" do
    @recipe = Recipe.new
    @recipe.title = "Yaourt"
    @recipe.image_file_name = "recipe.jpg"
    @recipe.save
    expect(@recipe) .not_to be_valid
  end
  it "should validate presence of image_file_name" do
    @recipe = Recipe.new
    @recipe.title = "Yaourt"
    @recipe.description = "blabla bla bla"
    @recipe.save
    expect(@recipe) .not_to be_valid
  end
end