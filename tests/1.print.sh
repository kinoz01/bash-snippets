#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Function to center-align text with color
text() {
   local text="$1"
   local color="\033[38;5;208m"
   echo -e "${color}${text}${RESET}"
}

# Function to center-align text with color
redtext() {
   local text="$1"
   local color='\033[0;31m'
   printf "$(echo -e "${color}${text}${RESET}")\n"
}

text 'hey'
redtext "How Are You"
