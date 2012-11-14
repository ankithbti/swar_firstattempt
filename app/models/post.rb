# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  image      :string(255)
#  author     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  	attr_accessible :author, :content, :image, :title, :tag_ids
  	has_many :taggings
  	has_many :tags, through: :taggings


	validates :title, presence: true
	validates :tag_list, presence: true
	validates :content, presence: true

	def self.search(search)
  	if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
