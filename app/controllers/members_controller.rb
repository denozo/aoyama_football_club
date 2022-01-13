class MembersController < ApplicationController
  
  def index
    @members = Member.page(params[:page]).per(12).order(:grade)
  end

  def show
    @member = Member.find(params[:id])
  end
end
