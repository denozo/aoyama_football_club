class Admins::MembersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page]).per(10).order(grade: "ASC")
  end

  def new
    @member = Member.new
  end

  def create
    @member =  Member.new(member_params)

    if @member.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_member_path(@member)
    else
      render :new
    end

  end

  def show
    @member = Member.find(params[:id])
    @category = Category.find(@member.category_id)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_member_path(@member)
    else
      render :edit
    end
  end

  def destroy
    member = Member.find(params[:id])

    if member.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_members_path
    else
      render :index
    end
  end
  
  def import
    Member.import(params[:file])
    redirect_to admins_members_path
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