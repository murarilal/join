class User < ActiveRecord::Base
  has_many :memberships	
  has_many :comments
  has_many :groups, :through => :memberships
  #attr_accessor :group_ids
end
