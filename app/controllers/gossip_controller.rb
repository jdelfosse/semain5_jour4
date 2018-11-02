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
			redirect_to "/gossip/gestion"			
		end
	end

	def creatcomment
		Comment.create(user_id: session[:user_id][0]["id"], gossip_id: params[:id], comment: params[:content],commenteable_id: params[:comment_id2] )
	end





	def like
		Like.create(gossip_id: params[:id])
		redirect_to request.referrer
	end

	def unlike
		Like.where(user_id: session[:user_id][0]["id"], gossip_id: params[:id]).first.destroy
		redirect_to request.referrer
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
			redirect_to "/gossip/gestion"		
		end
	end

	def index
		@all_comment = Comment.all			
  		@users = User.where(id: params[:id])
  		@like = Like.where(id: params[:id])
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
