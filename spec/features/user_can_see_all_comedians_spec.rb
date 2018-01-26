describe "as a user I can see all comedians" do
  context "when im on the index page" do
    it "i see all comedian's name and age" do
      hannibal = Comedian.create(name: "Hannibal Buress", age: 34)
      Special.create(name: "My Name is Hannibal", comedian: hannibal)
      mike = Comedian.create(name: "Mike Birbiglia", age: 39)
      Special.create(name: "What I Should Have Said Was Nothing", comedian: mike)

      visit "/comedians"

      save_and_open_page
      expect(page).to have_content("Hannibal Buress")
      expect(page).to have_content("My Name is Hannibal")
      expect(page).to have_content("34")
      expect(page).to have_content("Mike Birbiglia")
      expect(page).to have_content("What I Should Have Said Was Nothing")
      expect(page).to have_content("39")
      expect(page).to have_content("36")
    end
  end
end
