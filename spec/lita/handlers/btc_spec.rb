require "spec_helper"

describe Lita::Handlers::Btc, lita_handler: true do
  let(:robot) { Lita::Robot.new(registry) }
  subject { described_class.new(robot) }

  it { is_expected.to route("btc") }

  it "works" do
    send_message("btc")
    
  end
end
