BadAnswer.create!([
  {question_id: 1, wording: "super", reason: "Reserved word"},
  {question_id: 1, wording: "begin", reason: "Reserved word"},
  {question_id: 1, wording: "alias", reason: "Reserved word"},
  {question_id: 2, wording: "nil", reason: "foo will return a"},
  {question_id: 2, wording: "An error has occurred", reason: "the code is correct"},
  {question_id: 2, wording: "[1,2,3,4]", reason: "only *b return an array so [2,3,4]"},
  {question_id: 2, wording: "[1]", reason: "first params is not returned as an array"},
  {question_id: 3, wording: "15", reason: "No reason"},
  {question_id: 3, wording: "6", reason: "No reason"},
  {question_id: 3, wording: "4", reason: "No returns of key AND value number"},
  {question_id: 4, wording: "Current system time", reason: "Addition is valid"},
  {question_id: 4, wording: "An error has occurred.", reason: "No reason"},
  {question_id: 4, wording: "Nil", reason: "No reason"},
  {question_id: 4, wording: "1970-01-01 00:00:00 UTC", reason: "Not returns Epoch time origin"},
  {question_id: 5, wording: "365_", reason: "Cannot start with number"},
  {question_id: 5, wording: "Hello", reason: "Start with uppercase will declare a constant"},
  {question_id: 5, wording: "break", reason: "Is a reserved word"},
  {question_id: 5, wording: "%alpha", reason: "Special character are not allow"},
  {question_id: 6, wording: "0 1, 1 2", reason: "i is the value and j the index."},
  {question_id: 6, wording: "1 1, 2 2", reason: "Index start at 0"},
  {question_id: 6, wording: "3 1", reason: "Args in not added"},
  {question_id: 6, wording: "3 3", reason: "Index start at 0 and args in not added"},
  {question_id: 7, wording: "[90,92,94,96,98,100]", reason: "Downto iterates from a large number to min number."},
  {question_id: 7, wording: "[100,99,98,97,96,95,94,93,92,91,90] ", reason: "x%2==0 will return even number"},
  {question_id: 7, wording: "[]", reason: "No reason"},
  {question_id: 7, wording: "[99,97,95,93,91]", reason: "x%2==0 will return even number"},
  {question_id: 8, wording: "flatten", reason: "Returns a new array that is a one-dimensional flattening of self."},
  {question_id: 8, wording: "join", reason: "Returns a string created by converting each element of the array to a string."},
  {question_id: 8, wording: "compact!", reason: "Removes nil elements from the array."},
  {question_id: 8, wording: "uniq", reason: "Returns a new array by removing duplicate values"},
  {question_id: 9, wording: "An error has occurred", reason: "No reason"},
  {question_id: 9, wording: "Ruby on", reason: "\"R\" will be also deleted"},
  {question_id: 9, wording: "Rails", reason: "Doesn't return the deleted part"},
  {question_id: 9, wording: "Ruby on Rails", reason: "Doesn't change the actual string but still puts it"},
  {question_id: 10, wording: "Replace the last EOF with >>EOF.", reason: "No reason"},
  {question_id: 10, wording: "Replace the first <<EOF with << EOF.", reason: "No reason"},
  {question_id: 10, wording: "Replace the first <<EOF with <<-­-EOF.", reason: "No reason"},
  {question_id: 10, wording: "Replace the last EOF with EOF->>.", reason: "No reason"},
  {question_id: 11, wording: "remove", reason: "undefined method"},
  {question_id: 11, wording: "destroy", reason: "Remove targeted value"},
  {question_id: 11, wording: "empty?", reason: "Returns true if self contains no elements."},
  {question_id: 11, wording: "clear!", reason: "undefined method"},
  {question_id: 12, wording: "a.slice(0...2)", reason: "Index 0 to 1"},
  {question_id: 12, wording: "a[1..2]", reason: "Index 1 to 2"},
  {question_id: 12, wording: "a.slice!(0...2)", reason: "Index 0 to 1"},
  {question_id: 12, wording: "a[-5..-2]", reason: "Index 0 to 4"},
  {question_id: 13, wording: "\"RubyAssociation\\r\"", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 13, wording: "\"RubyAssociation\\r\\n\"", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 13, wording: "\"RubyAssociatio\"", reason: "Leaves  the  string  unchanged  if  it  doesn’t  \r\nend  in  a  record  separator."},
  {question_id: 13, wording: "\"RubyAssociation\\r\\n\\r\\n\"", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 14, wording: "\"RubyAssociation\\r\" ", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 14, wording: "\"RubyAssociation\\r\\n\" ", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 14, wording: "\"RubyAssociatio\"", reason: "Change the string only if doesn't end in a record separator"},
  {question_id: 14, wording: "\"RubyAssociation\\r\\n\\r\\n\"", reason: "Remove any trailing newline or carriage return characters"},
  {question_id: 15, wording: "Return a string describing this IO object.", reason: "This is inspect method"},
  {question_id: 15, wording: "Returns true if ios is associated with a terminal device, false otherwise.", reason: "This is isatty method"},
  {question_id: 15, wording: "Returns an integer representing the numeric file descriptor for ios.", reason: "This is fileno method"},
  {question_id: 15, wording: "Returns to the previous lineno", reason: "Doesn't exist"},
  {question_id: 16, wording: "&", reason: "Intersection"},
  {question_id: 16, wording: "|", reason: "Union"},
  {question_id: 16, wording: "+", reason: "Concatenation"},
  {question_id: 16, wording: "||", reason: "return mozart"},
  {question_id: 17, wording: "[]", reason: "No reason"},
  {question_id: 17, wording: "[1,3,5,2,4,6]", reason: "sort returns a new array created by sorting self"},
  {question_id: 17, wording: "nil", reason: "No reason"},
  {question_id: 17, wording: "[2,4,6,1,2,3]", reason: "sort returns a new array created by sorting self"},
  {question_id: 18, wording: "holland", reason: "Need a word which start with h or c and ends with o."},
  {question_id: 18, wording: "c35L320", reason: "Need a word which start with h or c and ends with o."},
  {question_id: 18, wording: "foo", reason: "Need a word which start with h or c and ends with o."},
  {question_id: 18, wording: "Oslo", reason: "Need a word which start with h or c and ends with o."},
  {question_id: 19, wording: "An error occurs since Greeting is a constant", reason: "The Ruby doesn’t enforce the constancy of constants."},
  {question_id: 19, wording: "\"Hello Ruby\" is displayed without warning.", reason: "The Ruby doesn’t enforce the constancy of constants"},
  {question_id: 19, wording: "\"Hi Ruby\" is displayed since Greeting is a constant.", reason: "The Ruby doesn’t enforce the constancy of constants"},
  {question_id: 19, wording: "\"Hello Ruby\" is displayed with warning.", reason: "The Ruby doesn’t enforce the constancy of constants"},
  {question_id: 20, wording: "\"rubyexamsilver\"", reason: "join returns a new string formed by joining the strings using File::SEPARATOR.(/)"},
  {question_id: 20, wording: "\"./ruby/exam/silver\"", reason: "join returns a new string formed by joining the strings using File::SEPARATOR.(/)"},
  {question_id: 20, wording: "\"./ruby\"", reason: "join returns a new string formed by joining the strings using File::SEPARATOR.(/)"},
  {question_id: 20, wording: "\"ruby/exam/silver/\"", reason: "join returns a new string formed by joining the strings using File::SEPARATOR.(/)"},
  {question_id: 21, wording: "50,50", reason: "No reason"},
  {question_id: 21, wording: "An error has occurred", reason: "No reason"},
  {question_id: 21, wording: "10,10", reason: "No reason"},
  {question_id: 21, wording: "50,nil", reason: "No reason"},
  {question_id: 22, wording: "\"test\"", reason: "slice! will return that"},
  {question_id: 22, wording: "nil", reason: "No reason"},
  {question_id: 22, wording: "\"\"", reason: "No reason"},
  {question_id: 22, wording: "\" code\"", reason: "Doesn't change or return the original string"},
  {question_id: 23, wording: "An error has occurred.", reason: "No reason"},
  {question_id: 23, wording: "US-­ASCII", reason: "Ruby 1.9: default string encoding"},
  {question_id: 23, wording: "ASCII-­8BIT", reason: "No reason"},
  {question_id: 23, wording: "Windows-31J", reason: "No reason"},
  {question_id: 24, wording: "p cc.has_key?(\"nz\")", reason: "Returns true if the key is present in hash."},
  {question_id: 24, wording: "p cc.key?(\"nz\")", reason: "Returns true if the key is present in hash."},
  {question_id: 24, wording: "p cc.include?(\"nz\")", reason: "Returns true if the key is present in hash."},
  {question_id: 24, wording: "p cc.member?(\"nz\")", reason: "Returns true if the key is present in hash."},
  {question_id: 25, wording: "String - Object - Kernel - Foo", reason: "No reason"},
  {question_id: 25, wording: "Object - Module - Object - Foo", reason: "No reason"},
  {question_id: 25, wording: "String - Module - String - Foo", reason: "No reason"},
  {question_id: 25, wording: "Object - Object - Module - Kernel", reason: "No reason"},
  {question_id: 26, wording: "(1)match (2)/\\w+/", reason: "match returns the first match as a MatchData object"},
  {question_id: 26, wording: "(1)sub (2)/\\w+/", reason: "Doesn't exist"},
  {question_id: 26, wording: "(1)search (2)/\\w+/", reason: "Doesn't exist"},
  {question_id: 26, wording: "(1)find (2)/\\w+/", reason: "NoMethodError"},
  {question_id: 27, wording: "an ArgumentError has occurred if arguments is not given.", reason: "No reason"},
  {question_id: 27, wording: "nil is returned if wrong encoding name is given.", reason: "No reason"},
  {question_id: 27, wording: "Returns a string containing the character represented by the int‘s value in UTF-8", reason: "No reason"},
  {question_id: 27, wording: "Integer is returned if wrong encoding name is given.", reason: "No reason"},
  {question_id: 28, wording: "(1) try, (2) catch NameError", reason: "Bad synthax"},
  {question_id: 28, wording: "(1)try, (2) catch IndexError", reason: "try is not used in ruby"},
  {question_id: 28, wording: "(1) begin, (2) rescue NameError", reason: "Not a NameError"},
  {question_id: 28, wording: "(1)begin, (2) catch IndexError", reason: "Bad synthax"},
  {question_id: 29, wording: "[1,2,3,4]", reason: "No reason"},
  {question_id: 29, wording: "[1]", reason: "No reason"},
  {question_id: 29, wording: "[1,2,3]", reason: "No reason"},
  {question_id: 29, wording: "[1,3,4]", reason: "No reason"},
  {question_id: 30, wording: "An error has occurred.", reason: "No reason"},
  {question_id: 30, wording: "\"foo4\"", reason: "No reason"},
  {question_id: 30, wording: "\"foofoo\"", reason: "No reason"},
  {question_id: 30, wording: "\"foofoo2\"", reason: "No reason"},
  {question_id: 31, wording: "234679", reason: "No reason"},
  {question_id: 31, wording: "9", reason: "No reason"},
  {question_id: 31, wording: "123458", reason: "No reason"},
  {question_id: 31, wording: "67", reason: "No reason"},
  {question_id: 32, wording: "An error has occurred.", reason: "No reason"},
  {question_id: 32, wording: "nil", reason: "No reason"},
  {question_id: 32, wording: "[1,2]", reason: "No reason"},
  {question_id: 32, wording: "2", reason: "No reason"},
  {question_id: 33, wording: "(1)to_a(\",\"), (2)split(\"\\n\")", reason: "No reason"},
  {question_id: 33, wording: "(1)to_a(\",\"), (2)join(\"\\n\")", reason: "No reason"},
  {question_id: 33, wording: "(1)split(\",\"), (2)concat(\"\\n\")", reason: "No reason"},
  {question_id: 33, wording: "(1)concat(\",\"), (2)join(\"\\n\")", reason: "No reason"},
  {question_id: 34, wording: "40", reason: "No reason"},
  {question_id: 34, wording: "3", reason: "No reason"},
  {question_id: 34, wording: "[3,89,40,39,29,10,50,59,69]", reason: "No reason"},
  {question_id: 34, wording: "[3,89]", reason: "No reason"},
  {question_id: 35, wording: "@num", reason: "instance variable"},
  {question_id: 35, wording: "$num", reason: "global variable"},
  {question_id: 35, wording: "Num", reason: "local constant"},
  {question_id: 35, wording: "num", reason: "local variable"},
  {question_id: 36, wording: "12", reason: "No reason"},
  {question_id: 36, wording: "012", reason: "No reason"},
  {question_id: 36, wording: "\"012\"", reason: "No reason"},
  {question_id: 36, wording: "nil", reason: "No reason"},
  {question_id: 37, wording: "[]", reason: "No reason"},
  {question_id: 37, wording: "An  error  has  occurred", reason: "No reason"},
  {question_id: 37, wording: "nil", reason: "No reason"},
  {question_id: 37, wording: "[[\"a\"],[\"b\"],[\"c\"],[\"d\"],[\"e\"],[\"f\"]]", reason: "No reason"},
  {question_id: 38, wording: "nil", reason: "No reason"},
  {question_id: 38, wording: "true", reason: "No reason"},
  {question_id: 38, wording: "false", reason: "No reason"},
  {question_id: 38, wording: "\"\"", reason: "No reason"},
  {question_id: 39, wording: "Ruby opens foo.txt in write only mode", reason: "No reason"},
  {question_id: 39, wording: "Ruby opens foo.txt in read write permission.", reason: "No reason"},
  {question_id: 39, wording: "foo.txt does not existed.", reason: "No reason"},
  {question_id: 39, wording: "Ruby opens foo.txt in Binary file mode", reason: "No reason"},
  {question_id: 40, wording: "nil", reason: "No reason"},
  {question_id: 40, wording: "10", reason: "No reason"},
  {question_id: 40, wording: "20", reason: "No reason"},
  {question_id: 40, wording: "[5,10,15]", reason: "No reason"},
  {question_id: 41, wording: "\"0xA,012\"", reason: "No reason"},
  {question_id: 41, wording: "20,20", reason: "No reason"},
  {question_id: 41, wording: "30,30", reason: "No reason"},
  {question_id: 41, wording: "40,40", reason: "No reason"},
  {question_id: 42, wording: "93094", reason: "No reason"},
  {question_id: 42, wording: "0-­93-­0‐94", reason: "No reason"},
  {question_id: 42, wording: "0x000000", reason: "No reason"},
  {question_id: 42, wording: "0123-8564", reason: "No reason"},
  {question_id: 43, wording: "nil", reason: "No reason"},
  {question_id: 43, wording: "Ruby Association", reason: "No reason"},
  {question_id: 43, wording: "Ruby on Rails", reason: "No reason"},
  {question_id: 43, wording: "ルビー\r\nЛУЧШИЙ ДРУГ ПРОГРАММИСТА", reason: "No reason"},
  {question_id: 44, wording: "capital = {Sweden: \"Stockholm\", Norway: \"Oslo\", Finland: \"Helsinki\"}", reason: "No reason"},
  {question_id: 44, wording: "capital = Hash[:Sweden,  \"Stockholm\", :Norway ,\"Oslo\", :Finland, \"Helsinki\"]", reason: "No reason"},
  {question_id: 44, wording: "capital = {:Sweden =>\"Stockholm\", :Norway=>\"Oslo\", :Finland=>\"Helsinki\"}", reason: "No reason"},
  {question_id: 44, wording: "capital = {\"Sweden\" => \"Stockholm\", \"Norway\" => \"Oslo\", \"Finland\" => \"Helsinki\"}", reason: "No reason"},
  {question_id: 45, wording: "readlines", reason: "Reads all of the lines in ios, and returns them in an array"},
  {question_id: 45, wording: "read", reason: "Reads length bytes from the I/O stream"},
  {question_id: 45, wording: "getc", reason: "Reads a one-character string from ios"},
  {question_id: 45, wording: "print", reason: "Writes the given object(s) to ios"}
])
