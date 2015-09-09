class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:home, :contact, :help]
  def home
    @products = Product.search(params[:search]).page(params[:page]).per_page(20)
    @users = User.search(params[:search]).page(params[:page]).per_page(3)
    @user = User.new
  end
  def treeview
  end
  def contact
  end
  def help
  end
end