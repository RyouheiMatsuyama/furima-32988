class ItemsController < ApplicationController
  def index
    # @listinds = Listing.all
  end

  def new
    #@listings = listing.new
  end

  def create
    #@listings = Listings.new(listings_params)
    #if @listings.save
      #redirect_to root_path
    #else
      #render :new
    #end
  end

  #private

  #def listing_params
    #params.require(:listings).permit(:nickname, :last_name, :first_name, :first_name_kana, :last_name_kana,
                                    #:birth_date).merge(user_id: current_user.id)
  #end
end
