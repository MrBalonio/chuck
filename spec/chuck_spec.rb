require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chuck" do
  before do
    HTTParty.stub_chain(:get, :parsed_response) do
      {
        "type"  => "success",
        "value" => {
          "id"   => 268,
          "joke" => "Time waits for no man. Unless that man is Chuck Norris."
        }
      }
    end
  end
  
  let(:chuck) { Chuck.retrieve }
  
  it 'should grab success value' do
    chuck.success.should eq(true)
  end
  
  it 'should grab joke ID' do
    chuck.id.should eq(268)
  end
  
  it 'should grab the joke' do
    chuck.joke.should eq("Time waits for no man. Unless that man is Chuck Norris.")
  end
end
