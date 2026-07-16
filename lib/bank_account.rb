# kinds_practice.rb — run with: ruby kinds_practice.rb
# RULE: write your prediction as a comment BEFORE each puts, then run and compare.

class BankAccount
  BANK_NAME = "Servas Bank"          # constant: shared, fixed

  def initialize(owner)              # runs once per .new
    @owner = owner                   # instance variable: THIS object's data
    @balance = 0
  end

  def deposit(amount)                # instance method: works on one object's data
    @balance = @balance + amount
    formatted_balance
  end

  def summary                        # instance method reading instance vars
    "#{@owner}: #{@balance} EUR at #{BANK_NAME}"
  end

  def self.motto                     # class method: no object needed, no @owner available!
    "#{BANK_NAME}: your money, pradsfaobably1 safe  asdf"
  end

    private

  def formatted_balance
    "#{@balance} EUR"
  end
end

# ---- experiments ----

a = BankAccount.new("Akif")
b = BankAccount.new("Banu")

a.deposit(100)
a.deposit(50)
b.deposit(7)

# 1. predict both lines:
puts a.summary
puts b.summary

# 2. why are the balances different? (answer in a comment)

# 3. predict:
puts BankAccount.motto

# 4. predict: does this work or error? why?
# puts a.motto                 # uncomment, run, observe

# 5. predict: does this work or error? why?
# puts BankAccount.summary    # uncomment, run, observe

# 6. predict, then uncomment:
# puts a.instance_variable_get(:@balance)
# puts b.instance_variable_get(:@balance)

# 7. HARD: inside self.motto, try adding @owner to the string.
#    Predict what prints. Why?
