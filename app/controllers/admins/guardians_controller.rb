class Admins::GuardiansController < ApplicationController

  before_action :authenticate_admin!

  def index
    @guardians = Guardian.page(params[:page]).per(10)
  end

  def show
    @guardian = Guardian.find(params[:id])
  end

  def edit
    @guardian = Guardian.find(params[:id])
  end

  def update
    @guardian = Guardian.find(params[:id])

    if @guardian.update(guardian_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_guardian_path(@guardian)
    else
      render :edit
    end
  end

  def destroy
    guardian = Guardian.find(params[:id])
    if guardian.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_guardians_path
    else
      render :index
    end
  end


  private

  def guardian_params
    params.require(:guardian).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :relationship,
      :member_name,
      :year_of_enrollment,
      :postal_code,
      :address,
      :tel
      )
  end


end
