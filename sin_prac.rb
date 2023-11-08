require 'sinatra'
class Stream
  def each
    100.times do |i|
      yield "#{i}\n"

    end
  end

end

get '/' do
  Stream.new

end

