#!/bin/bash

# Generate a random number between 1 and 100
TARGET=$(( RANDOM % 100 + 1 ))

# Initialize the guess variable
GUESS=0

# Function to check the guess
check_guess() {
    if [ $GUESS -lt $TARGET ]; then
        echo "Too low!"
    elif [ $GUESS -gt $TARGET ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the right number: $TARGET"
    fi
}

# Start the guessing game
echo "Guess the number (between 1 and 100):"

# While loop to continue prompting until the guess is correct
while [ $GUESS -ne $TARGET ]; do
    read -p "Enter your guess: " GUESS

    # Check if the input is a valid number
    if ! echo "$GUESS" | grep -qE '^[0-9]+$'; then
        echo "Invalid input. Please enter a number."
        continue
    fi

    # Check the guess
    check_guess
done

echo "Game over!"
