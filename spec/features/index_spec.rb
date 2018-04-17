require 'rails_helper'

feature "Testing infrastructure" do
  scenario "App loads and content is displayed" do
    visit("/")
    expect(page).to have_content("Instogram")
  end
end


feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "Post one")
    post_two = create(:post, caption: "Post two")
    visit '/'
    expect(page).to have_content("Post one")
    expect(page).to have_content("Post two")
    expect(page).to have_css("img[src*='cat']")
  end
end

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
