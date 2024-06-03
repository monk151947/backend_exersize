#!/bin/bash

# Run RSpec tests
echo "Running RSpec tests..."
rspec spec/questionnaire_spec.rb

# Check if RSpec tests passed
if [ $? -eq 0 ]; then
  echo "RSpec tests passed!"
else
  echo "RSpec tests failed!"
  exit 1
fi

# Run the Ruby script
echo "Running the Ruby script..."
ruby lib/questionnaire.rb