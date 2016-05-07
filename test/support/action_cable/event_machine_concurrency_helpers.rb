# source: https://github.com/rails/rails/tree/master/actioncable/test
module EventMachineConcurrencyHelpers
  def wait_for_async
    EM.run_deferred_callbacks
  end

  def run_in_eventmachine
    failure = nil
    EM.run do
      begin
        yield
      rescue => ex
        failure = ex
      ensure
        wait_for_async
        EM.stop if EM.reactor_running?
      end
    end
    raise failure if failure
  end
end
