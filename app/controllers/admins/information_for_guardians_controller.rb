class Admins::InformationForGuardiansController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @informationforguardians = InformationForGuardian.page(params[:page]).per(10)
  end

  def new
    @informationforguardian = InformationForGuardian.new
  end

  def create
    @informationforguardian = InformationForGuardian.new(information_for_guardian_params)

    if @informationforguardian.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_information_for_guardian_path(@informationforguardian)
    else
      render :new
    end
  end

  def show
    @informationforguardian = InformationForGuardian.find(params[:id])
  end

  def edit
    @informationforguardian = InformationForGuardian.find(params[:id])
  end

  def update
    @informationforguardian = InformationForGuardian.find(params[:id])

    if @informationforguardian.update(information_for_guardian_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_information_for_guardian_path(@informationforguardian)
    else
      render :edit
    end
  end

  def destroy
    informationforguardian = InformationForGuardian.find(params[:id])
    
    if informationforguardian.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_information_for_guardians_path
    else
      render :index
    end
  end

  private

  def information_for_guardian_params
    params.require(:information_for_guardian).permit(:category, :title, :content, :image)
  end

end
