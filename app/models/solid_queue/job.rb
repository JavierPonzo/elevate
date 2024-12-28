module SolidQueue
  class Job < SolidQueue::Record
    self.table_name = "solid_queue_jobs"
  end
end
