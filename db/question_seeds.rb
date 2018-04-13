questions_list = [
  [8,"Which of the following are NOT reserved words in Ruby?",0,
    [["try","Is not a reserved word"],["goto","Is not a reserved word"]],
    [["super","Is a reserved word"],["begin","Is a reserved word"],["alias","Is a reserved word"]]  
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
