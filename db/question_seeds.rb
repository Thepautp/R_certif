questions_list = [
  [8,"Which of the following are NOT reserved words in Ruby?",0,
    [["try","Not a reserved word"],["goto","Not a reserved word"]],
    [["super","Reserved word"],["begin","Reserved word"],["alias","Reserved word"]]
  ],
  [1,"Which of the following is the correct output for the program given below?",0,
    [["1","a is defined and will be returned"]],
    [["nil","foo will return a"],["An error has occurred","the code is correct"],["[1,2,3,4]","only *b return an array so [2,3,4]"],["[1]","first params is not returned as an array"]],
    "def foo (a,  *b) p  a end foo(1,2,3,4)"
  ],
  [9,"Which of the following is the correct output for the program given below?",0,
    [["2","Returns the number of key-value pairs"]],
    [["15","No reason"],["6","No reason"],["4","No returns of key AND value number"]],
    'puts({"members" => 193, "year" => 2014}.size)'
  ]
]
questions_list.each do |q|
  question = Question.create(categorie_id: q[0], text: q[1], rank: q[2], snippet: q[5])
  q[3].each do |good|
    question.good_answers.create(wording: good[0], reason: good[1])
  end
  q[4].each do |bad|
    question.bad_answers.create(wording: bad[0], reason: bad[1])
  end  
end
