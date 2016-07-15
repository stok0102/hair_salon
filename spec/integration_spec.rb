require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a new stylist') do
    visit('/')
    fill_in('stylist_name', :with => "Gerald")
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link('Return Home')
    expect(page).to have_content("Gerald")
  end
end

describe('deleting a stylist', {:type => :feature}) do
  it "allows a user to delete a stylist" do
    gerry = Stylist.new({:name => "Gerry", :id => nil})
    gerry.save()
    cliff = Stylist.new({:name => "Cliff", :id => nil})
    cliff.save()
    visit("/")
    click_button("Delete Stylist")
    expect(Stylist.all()).to(eq([cliff]))
  end
end

describe('add a client to a stylist', {:type => :feature}) do
  it "allows a user to add a client to a stylist" do
    gerry = Stylist.new({:name => "Gerry", :id => nil})
    gerry.save()
    visit("/")
    click_link("Gerry")
    fill_in("name", :with => "Eleanore")
    click_button("Add client")
    click_link("Return Home")
    click_link("Gerry")
    expect(page).to have_content("Eleanore")
  end
end
