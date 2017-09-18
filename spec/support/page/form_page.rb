class FormPage

  include Capybara::DSL

  def open
    visit('/php/demo_form_validation_complete.php')
  end

  def fill_form_name(term)
    fill_in('name', with: term)
  end

  def fill_form_email(term)
    fill_in('email', with: term)
  end

  def fill_form_site(term)
    fill_in('website', with: term)
  end

  def fill_form_comment(term)
    fill_in('comment', with: term)
  end

  def choose_form_gender_male
    find(:xpath, "//form/input[5]").click
  end

  def choose_form_gender_female
    find(:xpath, "//form/input[4]").click
  end

  def button_form_submit
    find_button('Submit').click
  end
end
