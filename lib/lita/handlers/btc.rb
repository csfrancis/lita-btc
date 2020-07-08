require 'multi_json'

module Lita
  module Handlers
    class Btc < Handler
      URL = "https://api.coindesk.com/v1/bpi/currentprice.json"

      # insert handler code here
      route(/^btc\s*$/, :btc)

      def btc(response)
        doc = MultiJson.load(http.get(URL).body)
        btc = doc["bpi"]["USD"]["rate_float"]
        response.reply("BTC: #{sprintf(btc, "%.2f")}USD")
      end

      Lita.register_handler(self)
    end
  end
end
