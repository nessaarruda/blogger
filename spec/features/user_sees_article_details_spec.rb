require "rails_helper"

describe "user sees one article" do
  describe "they link from the article index" do
    before :each do
        @article = Article.create!(title: "New Title", body: "New Body")

        visit articles_path
        click_on(@article.title)
    end 
    it "displays information for one article" do

      expect(page).to have_content(@article.title)
      expect(page).to have_content(@article.body)
    end
  end
end