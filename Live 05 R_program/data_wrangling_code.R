## install packages
## install.packages(c("tidyverse", "readxl", "rjson", "rvest", "RSQLite", "lubridate"))

## load library
library(tidyverse)
library(readxl)
library(rjson)
library(rvest)
library(RSQLite)
library(lubridate)

## read data into RStudio
## CSV and text files

student1 <- read_csv("student1.csv")
student2 <- read_delim("student2.txt", delim=";")
student3 <- read_delim("student3.txt", delim="\t")

## Excel Files
student4 <- read_excel("student4.xlsx", "Sheet1")
student5 <- read_excel("student4.xlsx", 2)
student6 <- read_excel("student4.xlsx", 3, skip = 3)

## Combine (Appending Files)
student_list <- list(
  student1,
  student2,
  student3,
  student4,
  student5,
  student6
)

student_all <- bind_rows(student_list)

student_all[1:20, ]

## Load JSON Files
## JavaScript Object Notation
library(rjson)
employee <- fromJSON(file = "employees.json")
employee <- data.frame(employee)

new_employee <- fromJSON(file = "new_employees.json")
new_employee <- data.frame(new_employee)

all_employee <- bind_rows(list(employee, new_employee))

## Load HTML file
library(rvest)
school_website <- read_html("https://gist.githubusercontent.com/toyeiei/93246c33992805b69b5f84d9ec99fae4/raw/58d656b2b0e51cc6eb1ca5d8bba19f580909e5dd/school_website.html")

school_website %>%
  html_nodes("h2") %>%
  html_text()

teachers <- school_website %>%
  html_nodes("ul li") %>%
  html_text()

companies <- school_website %>%
  html_nodes("ol li") %>%
  html_text()

our_cool_teachers <- data.frame(teachers, companies)

## Load XML File
emails <- read_xml("https://gist.githubusercontent.com/toyeiei/7495caf051daec2d45d70cb2c3daa251/raw/aaccdae3a6f2c34e9b2c326bdb9b578565c06d37/test_email.xml")

contents <- emails %>%
  xml_nodes("content") %>%
  xml_text()

email_from <- emails %>%
  xml_nodes("from") %>%
  xml_text()

email_date <- emails %>%
  xml_nodes("date") %>%
  xml_text()

email_df <- data.frame(contents, email_from, email_date)

## Connect Database (SQLite)

## Create Connection to DB
library(RSQLite)
con <- dbConnect(SQLite(), "chinook.db")

dbListTables(con)
dbListFields(con, "customers")

customers <- dbGetQuery(con, "SELECT * FROM customers")
View(customers)

## count missing values (NA) in each column in dataframe
count_NA <- function(x) {
  sum(is.na(x))
}

## apply count_NA to every column in customers
lapply(customers, count_NA)
sapply(customers, count_NA)

## Get customers in USA
country <- "United Kingdom"

dbGetQuery(con, "select firstname, country 
                 from customers where country = ? ", 
           params = country)

## Create a function for MARKETING team
get_data_by_country <- function(country) {
  country <- toupper(country)
  dbGetQuery(con, "SELECT firstname, lastname, email, country
                   FROM customers
                   WHERE UPPER(country) = ?", params = country)
}

## Create a function for MARKETING team
## Get text input from users
getDataMkt <- function() {
  country <- toupper(readline("Select country: "))
  dbGetQuery(con, "SELECT firstname, lastname, email, country
                   FROM customers
                   WHERE UPPER(country) = ?", params = country)
}

## Close Connection
dbDisconnect(con)

## Read SPSS File (.sav)

































