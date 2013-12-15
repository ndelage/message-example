class Message
  attr_accessor :message

  def initialize(msg)
    @log = []

    @config = {:message => msg,
               :cursive => false,
               :backup_messages => ["goodbye", "bonjour"]}
  end

  def print_message?(time)
    true
  end

  def print
    if print_message?(Time.now)
      @log << get_message

      puts get_message
    end
  end

  def display_log
    puts "#{@log.size}: "
    puts @log.inspect
  end

  def get_message
    if rand(10) > 3
      @config[:message].upcase
    else
      @config[:backup_messages].sample.upcase
    end
  end
end

m = Message.new("hello world")

m.print
m.display_log
