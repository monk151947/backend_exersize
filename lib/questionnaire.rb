require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

VALID_ANSWERS = ["yes", "no", "y", "n"].freeze
#To get the user,s input and store it in the Pstore
def do_prompt(store)
  answers = store.transaction(true) { store[:answers] || {} }
  # Ask each question and get an answer from the user's input.
  QUESTIONS.each_key do |question_key|
    answer = nil
    loop do
      puts QUESTIONS[question_key]
      print " Answer (Yes/No/Y/N): "
      answer = $stdin.gets.chomp.downcase
      break if VALID_ANSWERS.include?(answer)
      puts "Invalid answer. Please enter Yes, No, Y, or N."
    end
    answers[question_key] = answer
  end
  
  # Store the answers in the PStore database
  store.transaction do
    store[:answers] = answers
  end
end

# To retrieve and display the answers from the PStore database
def do_report(store)
  stored_answers = store.transaction(true) { store[:answers] }

  puts "\n *** Here is your Questions and Answers ***"
  stored_answers.each do |key, answer|
    puts "#{QUESTIONS[key]} - #{answer}"
  end

  # Calculate and display the rating
  rating = calculate_rating(stored_answers)
  puts "\n Your Rating is: #{rating}%"
end

# To calculate the rating of Yes Answers
def calculate_rating(answers)
  total_ques = QUESTIONS.size
  yes_ans_count= answers.values.count { |ans| ans == 'yes' || ans == 'y' }
  rating = (100.0 *  yes_ans_count / total_ques).round(2)
  rating
end

# Call the Methods
do_prompt(store)
do_report(store)

