class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      flash[:success] = "Bienvenido, #{@user.first_name}!"
      redirect_to root_path
    else
      flash.now[:danger] = "¡Error de inicio de sesion! Por favor, consultar su correo electrónico y contraseña."
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "Cerraste la sesión."
    redirect_to login_url
  end
end
