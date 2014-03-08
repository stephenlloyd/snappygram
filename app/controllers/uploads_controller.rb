class UploadsController < ApplicationController
  def prepare_upload
  	@snap = Snap.new
  end

  def upload
  	@snap = Snap.upload_new_with(params)
  	if @snap.save
  		redirect_to root_path
  	end
  end
end
