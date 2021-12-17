class Admins::InformationForGuardiansController < ApplicationController

  def index
    @informationforguardians = InformationForGuardian.all
  end

  def new
    @informationforguardian = InformationForGuardian.new
  end

  def create
    informationforguardian = InformationForGuardian.new(information_for_guardian_params)

    if informationforguardian.save
      redirect_to admins_information_for_guardian_path(informationforguardian), notice: "お知らせを登録しました"
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
    informationforguardian = InformationForGuardian.find(params[:id])

    if informationforguardian.update(information_for_guardian_params)
      redirect_to admins_information_for_guardian_path(informationforguardian), notice: "お知らせを登録しました"
    else
      render :new
    end
  end

  def destroy
    informationforguardian = InformationForGuardian.find(params[:id])
    informationforguardian.destroy
    redirect_to admins_information_for_guardians_path
  end

  private

  def information_for_guardian_params
    params.require(:information_for_guardian).permit(:category, :title, :content, :image)
  end

end
