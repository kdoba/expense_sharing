class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def dashboard
    if (user_signed_in?)

      ## find all transactions that are shared with the current user
      user_trans = TransactionShare.joins(:transaction, :user).where(user_id: current_user.id)
      user_trans = user_trans.map{|t|
        [t.transaction, t.transaction.amount / TransactionShare.where(transaction_id: t.transaction.id).count]
      }

      #find all transactions that are not owned by current user
      @total_amount = user_trans.map { |t| t[0].user_id == current_user.id ? 0 : t[1] }.sum

      @grouped_user_trans = user_trans.group_by { |t| t[0].user }

    end



  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  end
end
