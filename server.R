
# Read in the design file
design <- readr::read_csv("design.csv")

# Randomly choose a row id
q1_id <- sample(design$id, 1)

# Store the chosen row id in the survey data (here q1_id will be the column name)
sd_store_value(q1_id)

# Filter the design to get the chosen row
numbers <- design |>
  filter(id == q1_id) |>
  pull(numbers)

# Create the options
q1_options <- c('option 1', 'option 2', 'option 3')
names(q1_options) <- numbers

# Create the reactive question
sd_question(
  id = "q1",
  type = "mc",
  label = "Which of these numbers is the largest?",
  option = q1_options,
  reactive = TRUE
)

##################
# database setup #
##################

# surveydown stores data on a database that you define at https://supabase.com/
# To connect to a database to store the survey data, update this with details
# from your supabase account and database. For this demo, we set pause = TRUE
# which will ignore the other settings and won't attempt to connect to the database.
# See documentation for details at https://surveydown.org/store-data

db <- sd_database(
  host   = "",
  dbname = "",
  port   = "",
  user   = "",
  table  = "",
  pause  = TRUE
)

################
# config setup #
################

# Use the sd_config() function to customize features in your survey, like
# logic to conditionally display questions or skip to pages based on responses
# to skip other questions in your survey. See documentation for details at
# https://surveydown.org/config

config <- sd_config()
