# == Schema Information
#
# Table name: imports
#
#  id             :bigint           not null, primary key
#  completed_at   :datetime
#  created_count  :integer
#  error_messages :text
#  filename       :string
#  skipped_count  :integer
#  status         :string
#  total_rows     :integer
#  user_email     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :import do
    user_email { "MyString" }
    filename { "MyString" }
    total_rows { 1 }
    created_count { 1 }
    skipped_count { 1 }
    error_messages { "MyText" }
    status { "MyString" }
    completed_at { "2025-10-25 20:06:07" }
  end
end
