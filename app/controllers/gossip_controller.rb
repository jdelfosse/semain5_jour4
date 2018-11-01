class GossipController < ApplicationController

	def gestion
		if session[:user_id]
			@all_gossip = Gossip.where(user_id: session[:user_id][0]["id"])
		else
			redirect_to "/registration/new"
		end
	end

	def change
		if Gossip.where(id: params[:id] , user_id: session[:user_id][0]["id"]).exists?
			Gossip.where(id: params[:id]).update(titre: params[:titre] , content: params[:content])
			redirect_to "/gossip"			
		end
	end

	def like
		Like.create(user_id: session[:user_id][0]["id"], gossip_id: params[:id])
		redirect_to "/gossip"
	end

	def unlike
		Like.where(user_id: session[:user_id][0]["id"], gossip_id: params[:id]).first.destroy
		redirect_to "/gossip"
	end

	def edit
		@gossip = Gossip.where(id: params[:id])
	end

	def view
		@all_gossip = Gossip.all
  		@all_users = User.all
  		@all_like = Like.all
	end

	def destroy
		if Gossip.where(id: params[:id] , user_id: session[:user_id][0]["id"]).exists?
			Gossip.find(params[:id]).destroy
			redirect_to "/gossip"			
		end
	end

	def index
		@gossip = Gossip.where(id: params[:id])
	end

	def newgossip
		if session[:user_id]
			@all_gossip = Gossip.all
		else
			redirect_to "/registration/new"
		end
	end

	def create
		if params[:titre] == "" || params[:content] == ""
			redirect_to "/gossip/new"
		else			
			Gossip.create!(titre: params[:titre] , content: params[:content], user_id: session[:user_id][0]["id"]) 
			redirect_to "/gossip"
		end
	end

	def redirect
		redirect_to "/gossip"
	end
end
