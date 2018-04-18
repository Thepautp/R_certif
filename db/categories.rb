categories = [
  "Method", "Class", "Scope", "Loop", "Regex", "Object", "Array", "Keyword",
  "Hash", "Symbol", "Block", "Iterator", "I/O", "Variable", "Constant",
  "String", "Number", "Range", "Module", "Inheritance", "Mixin", "Operator",
  "Encoding", "Alias", "Exception", "Conditional", "Kernel", "Comment",
  "Command line", "Pre-defined", "Non local exit", "Lambda", "Proc", "Thread",
  "Time"
]
categories.each do |cat|
  Categorie.create( label: cat)
end
