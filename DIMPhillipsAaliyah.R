---
title: "12DIM Lab Assignment"
author: "Aaliyah Phillips"
date: "2026-04-23"
output: html_document
editor_options: 
---
  
library(tidyverse)

students <- read_csv("https://pos.it/r4ds-students-csv")
students

#read aas N/A
students <- read_csv("https://pos.it/r4ds-students-csv", na = c("N/A", ""))
students

students |> 
  rename(
    student_id = `Student ID`,
    full_name = `Full Name`
  )

students |> janitor::clean_names()

students |>
  janitor::clean_names() |>
  mutate(meal_plan = factor(meal_plan))

students <- students |>
  janitor::clean_names() |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )

#read text strings that you’ve created and formatted like a CSV file
read_csv(
  "a,b,c
  1,2,3
  4,5,6"
)
#use skip = n to skip the first n lines
read_csv(
  "The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3",
  skip = 2
)  
#use comment = "#" to drop all lines that start with (e.g.) #
read_csv(
  "# A comment I want to skip
  x,y,z
  1,2,3",
  comment = "#"
)
#use col_names = FALSE to tell read_csv() not to treat the first row as headings 
read_csv(
  "1,2,3
  4,5,6",
  col_names = FALSE
)
#pass col_names a character vector which will be used as the column names
read_csv(
  "1,2,3
  4,5,6",
  col_names = c("x", "y", "z")
)
# use a heuristic to figure out the column types.
read_csv("
  logical,numeric,date,string
  TRUE,1,2021-01-15,abc
  false,4.5,2021-02-15,def
  T,Inf,2021-02-16,ghi
")
# Missing values, column types, and problems
simple_csv <- "
  x
  10
  .
  20
  30"
read_csv(simple_csv)
df <- read_csv(
  simple_csv, 
  col_types = list(x = col_double())
)
problems(df)
read_csv(simple_csv, na = ".")
