require 'pstore'
require 'stringio'
require_relative '../lib/questionnaire.rb' # Ensure this path is correct

RSpec.describe 'Prompt Methods' do
  let(:store) { PStore.new("test_tendable.pstore") }

  before do
    $stdin = StringIO.new('yes')
    # Clear the PStore before each test to ensure a clean slate
    store.transaction do
      store[:answers] = {}
    end
  end

  after do
    # Remove the test PStore file after each test
    File.delete("test_tendable.pstore") if File.exist?("test_tendable.pstore")
  end

  #TODO #go_prompt method  

  describe '#go_report' do
    it 'retrieves and displays stored answers with rating' do
      answers = {
        "q1" => "yes",
        "q2" => "no",
        "q3" => "y",
        "q4" => "n",
        "q5" => "yes"
      }

      store.transaction do
        store[:answers] = answers
      end

    end
  end

  describe '#calculate_rating' do
    it 'correctly calculates the rating' do
      answers = {
        "q1" => "yes",
        "q2" => "no",
        "q3" => "y",
        "q4" => "n",
        "q5" => "yes"
      }
      expect(calculate_rating(answers)).to eq(60.0)
    end

    it 'returns 0 if no yes answers' do
      answers = {
        "q1" => "no",
        "q2" => "no",
        "q3" => "n",
        "q4" => "n",
        "q5" => "no"
      }
      expect(calculate_rating(answers)).to eq(0.0)
    end

    it 'returns 100 if all yes answers' do
      answers = {
        "q1" => "yes",
        "q2" => "yes",
        "q3" => "yes",
        "q4" => "yes",
        "q5" => "yes"
      }
      expect(calculate_rating(answers)).to eq(100.0)
    end
  end
end
