class AssetsController < ApplicationController
  def show
    cls=params[:class].singularize.capitalize.constantize
    asset=cls.find params[:id]
    send_file asset.send(params[:attachment].singularize).path(params[:style])
  end
end