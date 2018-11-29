class ExhibitorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @exhibitors = Exhibitor.all
    @expo = Expo.find(params[:expo_id])
  end

  def show
    @exhibitor = Exhibitor.find(params[:id])
    @expo = Expo.find(params[:expo_id])
    @picture = Picture.new
    @pictures = user_pictures.reverse!
  end

  def favorite
    @exhibitor = Exhibitor.find(params[:id])
    @favorite = current_user.favorites.find_by(exhibitor_id: @exhibitor.id)

    if @favorite
      @favorite.destroy
    else
      Favorite.create(exhibitor_id: params[:id], user_id: current_user.id)
    end
    respond_to do |format|
      format.html { redirect_to expo_exhibitors_path(@exhibitor.expo) }
      format.js # <-- will render `app/views/exhibitors/favorite.js.erb`
    end
  end

  private

  def user_pictures
    all_pictures = Picture.all
    user = current_user.id
    pictures_array = []

    all_pictures.each do |picture|
      if picture.user_id == user && picture.exhibitor_id == @exhibitor.id
        pictures_array << picture
      end
    end
    pictures_array.sort_by {:id}
    return pictures_array
  end
end
