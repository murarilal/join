class User < ActiveRecord::Base
  has_many :memberships	
  has_many :comments
  has_many :groups, :through => :memberships
  attr_accessor :group_ids, :memberships

=begin 
   def self.update_user_memberships
  	@user = User.find(params[:id])
  	@memberships = params[:user][:group_ids]
    unless self.memberships.nil?
      self.memberships.each do |m|
        m.destroy unless memberships.include?(m.group_id)
        memberships.delete(m.group_id)
      end
    end
    memberships.each do |m|
      self.memberships.create(:group_id => m)
    end
  end
=end  
end
