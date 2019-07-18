require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ale" )}
  let(:brownie) { Dessert.new("brownie", 100, chef)}

  describe "#initialize" do

    it "sets a type" do 
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq ("100")
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Brownie.new("cake","tons",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do 
      brownie.add_ingredient("sample")
      expect(brownie.ingredients).to include("sample")
    end
  end

  describe "#mix!" do 
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
      
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(40)
      expect (brownie.quantity).to eq(60)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(220)}.to raise_error("not enouh left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect (chef.serve).to receive(:titalize).and_return("Chef Ale the thickest.")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
