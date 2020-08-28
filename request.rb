def request(address, api)
    require "uri"
    require "net/http"
    require "json"
    require 'openssl'

    url = URI(address + api)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    if response.code.to_i >=400
        return nil
    else
        return JSON.parse(response.read_body)
    end
end



