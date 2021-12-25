class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :relationship,
      :member_name,
      :year_of_enrollment,
      :postal_code,
      :address,
      :tel])
  end
  
 
  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admins_root_path
      when Guardian
      guardians_root_path
    end
  end
  
    private

      
    # def current_cart
    #   Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    #   cart = Cart.create
    #   session[:cart_id] = cart.id
    #   cart
    # end
    
    
    
    def current_cart
      # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
      @current_cart = Cart.find_by(id: session[:cart_id])
      # Cart情報が存在しない場合、@current_cartを作成
      @current_cart = Cart.create unless @current_cart
      # 取得したCart情報よりIDを取得し、セッションに設定
      session[:cart_id] = @current_cart.id
      # Cart情報を返却
      @current_cart
    end

end