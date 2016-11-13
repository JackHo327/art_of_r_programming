# String operation

## grep()
grep(pattern = ,x = )

## nchar()
nchar("abcds sdq")

## paste()
paste(... = ,sep = ,collapse = )

## sprintf()
sprintf(fmt = , ..., ...)

## substr()
substr(x = ,start =,stop = )

## strsplit()
strsplit(x = ,split = ,fixed = ) # return a list

## regexpr()
regexpr(pattern = ,text = ,ignore.case = ) # look the patter in text, and return the position of the first character which matches the pattern
regexpr(pattern = "aa",text ="aabbaabbaa")
# 1

## gregexpr()
gregexpr(pattern = "aa",text ="aabbaabbaa") # different with regexpr(), gregexpr() will find all the character's first position which matches the pattern
# 1,5,9

## RegExp

#./RegExp.md
