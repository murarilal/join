class UsersController < ApplicationController
  
  def index
    @users = User.all
  end  
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.joins(:memberships).new(user_params)
    if @user.save
      @groups = params[:user][:group_ids]
      @groups.each do |group|
        Membership.create(:group_id => group, :user_id => @user.id)
      end
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    #@user = User.find(params[:id])
    #@user.memberships.update_attributes(user_params)
    #@group = Membership.joins(:user).where(:user_id => @user.id)
    #@groups = params[:user][:group_ids]
    #@groups.each do |group|
     # Membership.update_attributes(:"@group.group_id" => group, :user_id => @user.id)
    #end
    @user = User.find(params[:id])
    Membership.update_user_memberships
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
  private

  def user_params
    params.require(:user).permit(:name, :admin, {:group_ids => []})
  end

end  
