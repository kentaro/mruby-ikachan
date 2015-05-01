class Ikachan
  DEFAULT_HOST = '127.0.0.1'
  DEFAULT_PORT = 4979

  def initialize(host = DEFAULT_HOST, port = DEFAULT_PORT)
    @base_url = "http://#{host}:#{port}"
    @client   = HttpRequest.new
  end

  def join(channel)
    request('join', :channel => channel)
  end

  def leave(channel)
    request('leave', :channel => channel)
  end

  def notice(channel, message)
    request('notice', :channel => channel, :message => message)
  end

  def privmsg(channel, message)
    request('privmsg', :channel => channel, :message => message)
  end

  private

  def request(command, params)
    @client.post("#{@base_url}/#{command}", params, {
      'Content-Type' => 'application/x-www-form-urlencoded',
    })
  end
end
