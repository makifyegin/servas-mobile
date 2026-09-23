# module_practice.rb — run with: ruby module_practice.rb
# RULE: predict in a comment BEFORE each puts, then run and compare.

# ---- Part 1: a plain module with one method ----

module Greetable
  def greet
    "Hello, I am #{name}!"
  end
end

# ---- Part 2: two UNRELATED classes, both include the same module ----

class Dog
  include Greetable

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

class Robot
  include Greetable

  def initialize(model)
    @model = model
  end

  def name
    "Unit-#{@model}"
  end
end

# ---- experiments ----

fido = Dog.new("Fido")
r2 = Robot.new("42")

# 1. predict both lines, then run:
puts fido.greet
puts r2.greet

class Cat
  extend Greetable
end

puts Cat.greet

# 2. Dog and Robot share NO parent class (both just inherit from Object).
#    Yet both can .greet. Why? (answer in a comment)

# 3. predict: does this work or error? why?
# puts Greetable.greet          # uncomment, run, observe

# 4. predict: does this work or error? why?
# puts Dog.greet                # uncomment, run, observe (hint: greet is an INSTANCE method)

# 5. HARD: add a second method to Greetable, e.g. `def farewell; "Bye from #{name}"; end`
#    Do Dog and Robot get it for free, without changing Dog/Robot at all? Try it.

# 6. Real-world link: in Rails, "config.include AuthStubs, type: :request" does the
#    SAME job as "include Greetable" above — except Rails does the "include" for you,
#    automatically, into every test file tagged type: :request, instead of you writing
#    "include AuthStubs" by hand in each spec file.