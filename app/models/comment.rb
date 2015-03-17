# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          not null
#  commentable_type :text             not null
#  author_id        :integer          not null
#  message          :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :commentable_id, :commentable_type, :author_id, :message, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  def authorized?(user)
    (user.id == self.author_id) || (user.id == self.commentable_id)
  end
end
