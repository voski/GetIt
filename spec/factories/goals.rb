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

FactoryGirl.define do
  factory :goal do
    name "MyString"
    status "MyString"
    completion "MyString"
    commentable_id 1
  end

end
