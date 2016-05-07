# source: https://github.com/rails/rails/tree/master/actioncable/test
module ConcurrentRubyConcurrencyHelpers
  def wait_for_async
    wait_for_executor Concurrent.global_io_executor
  end

  def run_in_eventmachine
    yield
    wait_for_async
  end
end
