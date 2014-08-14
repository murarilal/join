class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

=begin
  def self.update_membership_attributes
    @group = Membership.joins(:user).where(:user_id => @user.id)
      @groups = params[:user][:group_ids]
      @groups.each do |group|
        @group.group_id => group
        user_id => @user.id)
      end
  end	
=end
end