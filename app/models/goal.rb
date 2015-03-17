# == Schema Information
#
# Table name: goals
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  status         :string           not null
#  completion     :string           not null
#  commentable_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          default(0), not null
#

class Goal < ActiveRecord::Base
  GOAL_STATUS = ['private', 'public']
  GOAL_COMPLETION = ['incomplete', 'complete']

  validates :name, :status, :completion, :user_id, presence: true
  validates :status, inclusion: GOAL_STATUS
  validates :completion, inclusion: GOAL_COMPLETION
  include Commentable
  belongs_to :user

  def author?(check_user)
    self.user == check_user
  end

  def private?
    self.status == "private"
  end
end
