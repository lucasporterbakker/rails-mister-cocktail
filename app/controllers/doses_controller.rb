class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all.order(:name)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

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
  # no cocktail_id as that's coming from the backend and user doesn't provide input
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
