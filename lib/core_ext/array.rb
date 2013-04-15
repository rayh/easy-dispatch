class Array
  def apply
    pool = ::EasyDispatch::Pool.new concurrency
    mutex = Mutex.new
    index = 0
    self.each do |o|
      pool.dispatch do
        mutex.synchronize do 
          index += 1
        end
        # puts "Running job at index #{index}"
        yield(index, o)
        # puts "Finished job at index #{index}"
      end 
    end

    pool.join
  end
end