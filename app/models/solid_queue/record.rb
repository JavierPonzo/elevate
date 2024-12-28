module SolidQueue
  class Record < ApplicationRecord
    self.abstract_class = true
    connects_to database: { writing: :queue }
  end
end
