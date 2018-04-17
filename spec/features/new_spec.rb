require 'rails_helper'

feature "Create post" do
  scenario "Page has create form and create button" do
    visit("/posts/new")
    expect(page).to have_button('Create Post')
  end

  scenario "Page contains image and caption submitted" do
    visit("/posts/new")
    attach_file('Image', 'spec/images/cat.jpg')
    fill_in 'Caption', with: 'cat'
    click_button 'Create Post'
    expect(page).to have_content('cat')
    expect(page).to have_css("img[src*='cat.jpg']")
  end

  scenario "Error if image is not submitted" do
    visit("/posts/new")
    fill_in 'Caption', with: "Test"
    click_button 'Create Post'
    expect(page).to have_content("Please select an image to post")
  end










end
