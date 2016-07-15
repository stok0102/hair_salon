require("spec_helper")

describe(Stylist) do
  describe("#name") do
    it("returns a name") do
      test_stylist = Stylist.new({:name => "Connie"})
      expect(test_stylist.name()).to eq("Connie")
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it "empty at first" do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it "lets you save stylists to the database" do
      stylist = Stylist.new({:name => "Connie", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it "is the same stylist if it has the same name" do
      stylist1 = Stylist.new({:name => "Connie", :id => 1})
      stylist2 = Stylist.new({:name => "Connie", :id => 2})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it "returns a stylist by its ID" do
      test_stylist = Stylist.new({:name => "Connie", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Melika", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#delete") do
    it "lets you delete a stylist from the database" do
      stylist = Stylist.new({:name => "Connie", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Melika", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it "deletes all associated clients" do
      stylist = Stylist.new({:name => "Connie", :id => 1})
      client = Client.new({:name => "Jerry", :stylist_id => 1, :id => nil})
      client.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#update") do
    it "lets you update stylists in the database" do
      stylist = Stylist.new({:name => "Gene", :id => nil})
      stylist.save()
      stylist.update({:name => "Rochefort"})
      expect(stylist.name()).to(eq("Rochefort"))
    end
  end
end
