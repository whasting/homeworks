require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Bob") }
  let(:dessert) { Dessert.new("Cake", 15, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq "Cake"
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("Cupcake", "a", :chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients.first).to eq("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = %w(eggs, water, sugar, flour)
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.mix!).not_to eql(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      old_qty = dessert.quantity
      dessert.eat(1)
      new_qty = dessert.quantity
      expect(new_qty).not_to eql(old_qty)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { Dessert.new("Cookies", 4, :chef).eat(5) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      expect(dessert.serve).to eq("Chef Bob the Great Baker has made 15 Cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
