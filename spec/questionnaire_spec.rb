require 'pstore'
#require_relative '../questionnaire.rb'

RSpec.describe 'Prompt Methods' do
  let(:store) { PStore.new("test_tendable.pstore") }

  before do
    # Clear the PStore before each test to ensure a clean slate
    store.transaction do
      store[:answers] = {}
    end
  end

  after do
    # Remove the test PStore file after each test
    File.delete("test_tendable.pstore") if File.exist?("test_tendable.pstore")
  end

  #TODO adding a test case for do_promt and do_report method
end
