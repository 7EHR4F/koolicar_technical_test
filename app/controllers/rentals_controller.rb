class RentalsController < ApplicationController
  
  def index
    @rentals = Rental.all.reverse
  end

  def new
    @rental = Rental.new
  end
  
  def parse_locations
    @rental = Rental.new(rental_params)
	@rental.name = DateTime.now.to_s
	if @rental.save
	  @rental.process_csv()
	  redirect_to root_path
	end
  end
 
  private

  def rental_params
    params.require(:rental).permit(:csv)
  end
end
