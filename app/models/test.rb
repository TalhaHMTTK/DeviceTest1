class Test < ApplicationRecord
  enum :status, { planned: 0, working: 1, completed: 2 }
  belongs_to :device
  belongs_to :user
end
