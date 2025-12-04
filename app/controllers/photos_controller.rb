class PhotosController < ApplicationController

  def create
    @photos = Photo.all

  end
end
