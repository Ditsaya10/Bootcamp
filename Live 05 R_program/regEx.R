## Regular Expression in R

state.name

## Starts with A
grep("^A", state.name, value = TRUE)

## Ends with e
grep("e$", state.name, value = TRUE)

## Starts with N, Ends with e

"New Hampshire" 
grep("^N[a-zA-Z ]+e$", state.name, value=TRUE)

## Match state.name that has " " white space
grep("\\s", state.name, value = TRUE)

## grepl sibling
state.name[grepl("S", state.name, ignore.case = FALSE)]

## sub
sub("A", "Hello ", state.name)
