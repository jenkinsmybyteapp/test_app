module Features
  module SharedHelpers
    def wait_for_ajax(wait_time = 10)
      counter = 0
      while page.evaluate_script("jQuery.active").to_i > 0
        counter += 1
        sleep(0.1)
        raise "AJAX request took longer than #{wait_time} seconds." if counter >= wait_time * 10
      end
    end
  end
end
