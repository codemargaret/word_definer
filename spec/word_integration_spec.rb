require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  before() do
    Word.clear()
  end

  describe('My word list', {:type => :feature}) do
    it ('shows a list of entered words') do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      expect(page).to have_content('continent')
    end
  end

  describe('a word link', {:type => :feature}) do
    it ('navigates to an individual word page') do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      click_link('continent')
      expect(page).to have_content('continent')
    end
  end

  describe('a word page', {:type => :feature}) do
    it('shows one definition') do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      click_link('continent')
      fill_in('definition', :with => 'one of the seven main landmasses on Earth')
      click_button('Add definition')
      expect(page).to have_content('landmasses')
    end
  end
end #Word class
