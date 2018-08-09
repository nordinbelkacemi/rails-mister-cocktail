class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    dose = Dose.new(ingredient_id: params[:dose][:ingredient_id], description:  params[:dose][:description], cocktail_id: params[:cocktail_id])
    dose.save
  end

end
