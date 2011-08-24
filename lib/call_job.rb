require "net/http"
require "yaml"

class CallJob
  @queue = :call
  @token = YAML.load_file("config/at5001_config.yml")["provider"]["token"]
  
  def self.perform number
    res = Net::HTTP.post_form(URI.parse('http://api.tropo.com/1.0/sessions'), "token" => @token,
                                      "destination" => number)
  end
  
end
