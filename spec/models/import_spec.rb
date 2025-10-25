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
require 'rails_helper'

RSpec.describe Import, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
