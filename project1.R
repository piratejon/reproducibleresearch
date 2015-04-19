
default.input_filename <- 'activity.csv'

obtain_input <- function(input_filename = default.input_filename) {
    setClass('dateCol')
    setAs("character", "dateCol", function(from) as.Date(from, format="%Y-%m-%d"))
    read.csv(input_filename, header=TRUE, sep=',', colClasses=c('integer', 'dateCol', 'integer'))
}

# What is the mean number of total steps per day?
steps <- obtain_input()
total_steps_per_day <- xtabs(steps ~ date, data=steps)

