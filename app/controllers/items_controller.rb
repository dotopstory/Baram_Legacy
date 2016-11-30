class ItemsController < ApplicationController
        
    #before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]

    def show
        @item = Item.find(params[:id])
        redirect_to root_url and return unless @user.activated?
    end
    
    def index
        @items = Item.all
    end 
    
    def new
      @item =  Item.new
    end
    
    def create
        @monster = Item.new
        render 'new' 
    end 
    
    def edit 
        @item = Item.find(params[:id])
    end 
    
    def update
        @item = User.find(params[:id])
        if @item.update_attributes(user_params)
        flash[:success] = "Profile updated" 
        redirect_to @item
        else 
        render 'edit' 
        end 
    end 
    
    def destroy 
        Item.find(params[:id]).destroy 
        flash[:success] = "Item deleted" 
        redirect_to items_url
    end 
      
end
