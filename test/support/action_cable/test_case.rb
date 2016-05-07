# source: https://github.com/rails/rails/tree/master/actioncable/test
class ActionCable::TestCase < ActiveSupport::TestCase
  if ENV['FAYE'].present?
    include EventMachineConcurrencyHelpers
  else
    include ConcurrentRubyConcurrencyHelpers
  end

  def wait_for_executor(executor)
    until executor.completed_task_count == executor.scheduled_task_count
      sleep 0.1
    end
  end
end
