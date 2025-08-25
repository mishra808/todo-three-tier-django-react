# Function to print colored text
print_colored() {
  local color=$1
  local text=$2
  echo -e "\e[${color}m${text}\e[0m"
}

# Function to print yellow text
print_yellow() {
  print_colored "33" "$1"
}

# Function to print red text
print_red() {
  print_colored "31" "$1"
}

# Function to print green text
print_green() {
  print_colored "32" "$1"
}