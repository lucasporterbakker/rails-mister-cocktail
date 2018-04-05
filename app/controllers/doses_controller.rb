class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all.order(:name)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  # DELETE "doses/25"
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    # after destroyed takes me back to that cocktail page
    redirect_to cocktail_path(@cocktail)
  end

  # if take in directly what users input so we create private method
  # when user putting in params adhers to validation for security
  private

  # when create new dose we put in parameters
  # (description, ingredient_id and ingredient)
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
