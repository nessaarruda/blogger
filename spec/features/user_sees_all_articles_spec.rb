require "rails_helper"

describe "user sees all articles" do
  describe "they visit /articles" do
    before :each do 
      @article_1 = Article.create!(title: "Title 1", body: "Body 1")
      @article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path
    end 
    it "displays all articles" do
        
        expect(page).to have_content(@article_1.title)
        expect(page).to have_content(@article_2.title)
    end

    it "has article link" do

        expect(page).to have_link(@article_1.title)
        expect(page).to have_link(@article_2.title)
    end
    it "redirect on click" do

        click_on(@article_1.title)

        expect(current_path).to eq(article_path(@article_1))
    end
    it "has link to create new article" do

        click_on('Create New Article')

        expect(current_path).to eq(new_article_path)
    end
  end
end