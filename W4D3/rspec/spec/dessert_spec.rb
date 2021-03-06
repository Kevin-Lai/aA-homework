require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "kevin lai") }
  let(:cake) {Dessert.new("cake", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", "100", chef)}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("flour")
      expect(cake.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test_ingredients = ["flour", "egg", "milk", "cream"]
      
      cake.add_ingredient("flour")
      cake.add_ingredient("egg")
      cake.add_ingredient("milk")
      cake.add_ingredient("cream")
      expect(cake.ingredients).to eq(test_ingredients)

      # after mixing, the order should be different
      cake.mix!
      expect(cake.ingredients).to_not eq(test_ingredients)

      # if the ingredients are sorted, then it should be the same as test_ingredients
      expect(cake.ingredients.sort).to eq(test_ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(25)
      expect(cake.quantity).to eq(75)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cake.eat(125)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # allow(obj).to receive(:method) { return_val }
      allow(chef).to receive(:titleize) {"Chef Kevin Lai the Great Baker"}

      expect(cake.serve).to eq("Chef Kevin Lai the Great Baker has made 100 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)

      cake.make_more
    end
  end
end
