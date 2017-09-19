require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  before() do
    Word.clear()
  end

  describe('My word list', {:type => :feature}) do
    before() do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
    end

    it ('add a word') do
      expect(page).to have_content('continent')
    end
  end

  describe('individual word page', {:type => :feature}) do
    before() do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      click_link("continent")
    end

    it ('navigates to an individual word page') do
      expect(page).to have_content('continent')
    end

    describe('adding definitions') do
      before() do
        fill_in('definition', :with => 'one of the seven main landmasses on the Earth')
        click_button('Add definition')
      end

      it('displays a definition') do
        expect(page).to have_content('one of the seven main landmasses on the Earth')
      end

      describe('add second definition') do
        before() do
          fill_in('definition', :with => 'a large landmass on another planet')
          click_button('Add definition')
        end

        it('displays both definitions') do
          expect(page).to have_content('one of the seven main landmasses on the Earth')
          expect(page).to have_content('a large landmass on another planet')
        end
      end
    end #adding definitions
  end #individual word page

end #Word class
