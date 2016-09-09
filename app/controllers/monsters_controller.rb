class MonstersController < ApplicationController
    
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]

     def show 
        @monster = Monster.find(params[:id])
      # redirect_to root_url and return unless @user.activated?
     end
     
     def index
       @monsters = Monster.all
     end 
     
      
      
      def new
        @monster =  Monster.new
      end
      
      def create
        @monster = Monster.new
         render 'new' 
      end 
      
      def edit 
        @monster = Monster.find(params[:id])
      end 
      
      def update
        @monster = User.find(params[:id])
        if @monster.update_attributes(user_params)
          flash[:success] = "Profile updated" 
          redirect_to @monster
        else 
          render 'edit' 
        end 
      end 
      
      def destroy 
        Monster.find(params[:id]).destroy 
        flash[:success] = "Monster deleted" 
        redirect_to monsters_url
      end 
      
    
      
    
end
