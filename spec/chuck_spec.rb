require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Chuck" do
  before do
    HTTParty.stub_chain(:get, :parsed_response) do
      {
        "type" => "success",
        "value" => [
          {
            "id" => 490,
            "joke" => "Chuck Norris doesn't need to use AJAX because pages are too afraid to postback anyways.",
            "categories" => ["nerdy", "chuck norris"]
          }, {
            "id" => 416,
            "joke" => "Chuck Norris plays racquetball with a waffle iron and a bowling ball.",
            "categories" => ["chuck norris"] 
          }, {
            "id" => 413, "joke" => "Those aren't credits that roll after Walker Texas Ranger. It is actually a list of fatalities that occurred during the making of the episode.",
            "categories" => ["chuck norris"]
          }
        ]
      }
    end
  end

  let(:chuck) { Chuck.retrieve(quantity: 3) }

  it 'should grab success value' do
    chuck.success.should eq(true)
  end

  it 'should grab joke ID' do
    chuck.id.should eq(268)
  end

  it 'should grab the joke' do
    chuck.joke.should eq("Time waits for no man. Unless that man is Chuck Norris.")
  end
  
  it 'should pass params to ICNDb properly' do
    
  end
end
