class Admins::MembersController < ApplicationController
  
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member =  Member.new(member_params)
    @member.save
    redirect_to admins_member_path(@member)
  end

  def show
    @member = Member.find(params[:id])
    @category = Category.find(@member.category_id)
  end

  def edit
  end

  def update
  end
  
  private
  
  def member_params
    params.require(:member).permit(
      :category_id,
      :image,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :grade,
      :position,
      :height,
      :weight,
      :original_team,
      :hobby,
      :goal)
  end
  
end