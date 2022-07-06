class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def following
    @users = User.find(params[:user_id]).following
  end

  def followers
    @users = User.find(params[:user_id]).followers
  end

  def create
    relationship = Relationship.new(followed_id: params[:user_id], follower_id: current_user.id)
    relationship.save
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find_by(followed_id: params[:user_id], follower_id: current_user.id)
    relationship.destroy
    redirect_to request.referer
  end
end
