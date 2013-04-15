module EasyDispatch
  class Pool
    require 'thread'

    def initialize size
      @running = true
      @queue = Queue.new #SizedQueue.new 1
      @mutex = Mutex.new
      @threads = []
      @exception = nil

      increment size

      puts @threads.inspect
    end

    def increment num=1
      num.times do
        @mutex.synchronize do
          @threads.push(
            Thread.new do |tid|
              # puts "#{tid} Thread starting..."
              loop do
                begin
                  Thread.exit unless @running
                  # puts "#{tid} Wating for work..."
                  block = @queue.pop
                  # puts "#{tid} Spawn worker with #{block}"
                  block.call
                rescue SignalException => e
                  puts "#{tid} Interuppted"
                  Thread.exit
                rescue Exception => e
                  @exception = e
                  Thread.exit
                  puts "#{tid} Exception: #{e}"
                ensure
                  # puts "#{tid} End worker with #{block}"
                end
              end
            end
          )
        end
      end
      # @thread_count+=num
    end

    def decrement num=1
      num.times do 
        @mutex.synchronize do
          dispatch do
            Thread.current.exit
          end
        end
      end
    end

    def dispatch(&block)
      @queue.push(block)
    end

    def join
      while @queue.size > 0
        raise @exception unless @exception.nil?
        sleep 0.5
      end

      @running = false
      decrement @threads.count

      @threads.each do |thread|
        @mutex.synchronize do
          thread.join
          @threads.delete thread
        end
      end

      raise @exception unless @exception.nil?

    end
  end

end