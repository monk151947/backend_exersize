# Tendable Coding 

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Approach

To store the answers using **Pstore database**

The VALID_ANSWERS constant includes the valid responses ("yes", "no", "y", "n") in lowercase for easy comparison

Displaying each question, a loop is used to repeatedly prompt the user until they provide a valid answer.

If the input is valid, it breaks out of the loop; otherwise, it displays an error message and prompts again.

Store the collected answers are stored in the PStore database

Retrieve and display the answers from the **PStore** and Calculate the Calculates the rating as 100 * number of yes answers / number of questions.

