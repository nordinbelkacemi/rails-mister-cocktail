class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    cocktail_id = params[:cocktail_id]
    ingredient_id = params[:dose][:ingredient_id]
    description = params[:dose][:description]
    @dose = Dose.new(description: description, ingredient_id: ingredient_id, cocktail_id: cocktail_id)
    if @dose.save
      redirect_to cocktail_path(cocktail_id)
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new
      render :new
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

end
