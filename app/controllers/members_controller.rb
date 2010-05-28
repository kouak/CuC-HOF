class MembersController < ApplicationController
  def index
    @members = User.paginate :page => params[:page], :order => 'created_at DESC'
  end
end
