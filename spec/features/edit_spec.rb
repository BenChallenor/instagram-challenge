require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Thats a great cat"
    click_button 'Update Post'
    expect(page).to have_content("Thats a great cat")
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Are you sure you want to delete this post?')
  end
end
