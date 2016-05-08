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

  def assert_broadcast_to(channel: nil, data: nil)
    ActionCable::Server::Base.any_instance.expects(:broadcast).with(channel, data)
  end

  def assert_stream_from(klass, broadcasting)
    klass.any_instance.expects(:stream_from).with(broadcasting)
  end

  def connection(user = nil)
    TestConnection.new(user)
  end

  def identifier
    ''
  end
end
