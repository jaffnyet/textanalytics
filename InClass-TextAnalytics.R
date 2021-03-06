

#1.
print("\"")

cat("\"")
cat("ab\ncd")
cat("a\tb\nc\td")

#2. # \ use to escape something
cat(":-\\")
cat("(^_^\")")
cat("@_'-'")
cat("\\m/")

#3. 
library(stringr)
?str_locate
?str_sub


#4.
str_locate(string = "great", pattern = "a")

list = c("great","fantastic","super")
str_locate(string = list , pattern = "a")
occurance = str_locate_all(string = list, pattern = "a")
occurance[1]
# occurance[1,1]
x = occurance[[1]]
x[1]

### or
occurance[[1]][1]


#5.

str_sub(string = "testing", start = 1, end = 3)

# Same as before
str_sub(string = "testing", end = 3)

str_sub("testing", 
        start = 4, 
        end = str_length("testing"))

str_sub("testing",
        start = 1,
        end = 4)

#6.
input = c("abc","defg")
str_sub(input,c(2,3))

#7.

emails = readRDS("email.rds")
emails[1]
cat(emails[1])
str_locate(string = emails[1],
           pattern= "\n\n")

#8.
metadata1 = str_sub(emails[1],start = 1, end = 842)
body1 = str_sub(emails[1], start = 844)

cat(metadata1)
cat(body1)

#9.

str_split(string = metadata1,
          pattern = "\n")

#10.
breaks = str_locate(emails, pattern = "\n\n")
metadata = str_sub(emails, start = 1, end = breaks[,1] )
body = str_sub(emails, start = breaks[,2])

### Handout 2

#1.

fruit = c("apple","banana","pear","pineapple")

#2. regular expression

str_detect(fruit,"a")
str_detect(fruit,pattern = "^a")
str_detect(fruit, pattern = "a$")
str_detect(fruit, "[aeiou]")
str_detect(fruit, "[a-d]")

# detect a string that starts with "a" and ends with "e"
str_detect(fruit, pattern = "^a[a-z]e$") 
# expect to have three characters starts with a, a-z in the middle, and e at last

#3.
str_detect(fruit, pattern = "^a[a-z]*e$")

#4.
phone = c("213 740 4826","213-740-4826","213.740.4826","(213) 740-4826996")
parser = "[0-9]{3}[ -.][0-9]{3}[ -.][0-9]{4}" # repeat 6 times still align with 4 times
parser1 = "[(]?[0-9]{3}[)]?[ -.][0-9]{3}[ -.][0-9]{4}\\b" # \\b constrain to digit up to 4
#()taking as a grouping function, so add [] to let it become a string
str_detect(phone, parser)

#5.
cat(body[10])
cat(body[18])

str_extract(string = body, pattern = parser )


#6.
parser2 = "[0-9]{5}(-[0-9]{4})?"
#(): use it to group
zip = c("90028","90028-0809")
str_detect(zip,pattern = parser2)
