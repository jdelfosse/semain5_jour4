class RegistrationController < ApplicationController

	def create
		if (params[:password] != params[:passwordverif]) || (( params[:password] == "") ||  (params[:name] == "") ||  (params[:email] == ""))
			redirect_to "/registration/new"			
		else
			User.create!(name: params[:name] , email: params[:email], password: params[:password]) 
			redirect_to "/registration/new"
  		end
  	end

  	def new
  		@all_users = User.all
  	end

	def conexion
		@current_user = User.where(name: params[:name],email: params[:email], password: params[:password])

	    if @current_user.where(name: params[:name],email: params[:email], password: params[:password]).exists?

	      session[:user_id] = @current_user

	      flash[:info] = "Vous êtes maintenant connecté"

		  redirect_to "/gossip"

	    else

	      session[:user_id] = nil
		  redirect_to "/gossip"

	    end
	end

	def deconexion
      session[:user_id] = nil
	  redirect_to request.referrer

	end
end
