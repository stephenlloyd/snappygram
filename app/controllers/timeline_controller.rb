class TimelineController < ApplicationController
  def index
  	@snaps = Snap.all
  end
end
