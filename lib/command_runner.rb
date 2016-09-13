class CommandRunner

  def self.process(path)
    text = File.read(path)
    commands = find_commands(text)
  end

  def self.find_commands(text)
    segments = command_matchers.reduce([text]) do |result, (matcher, fn)|
    binding.pry

      result.flat_map { |part| { match: part.split(matcher), fn: fn } }
    end
    segments.each { |segment| send_segment(segment) }
  end

  def self.send_segment(segment)
    match, fn = segment.values_at(:match, :fn)
    self.send(fn, match)
  end

  def self.command_matchers
    {
      /^\(\)/ => :function,
            
    }
  end

  private
  def self.function(text)
    binding.pry
  end

end
