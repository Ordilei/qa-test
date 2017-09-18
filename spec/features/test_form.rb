require "spec_act_helper"
require "faker"

feature "Validando fluxos e campos de um mesmo formulário" do

  let!(:phone) { "119"+Faker::Number.number(8) }
  let!(:name) { Faker::Name.name }
  let!(:email) { Faker::Number.between(1, 10000000).to_s + "email@chammy.info"}
  let!(:site) { "http://" + Faker::Number.between(1, 10000000).to_s + ".com.br"}
  let!(:text) { Faker::ChuckNorris.fact }

  scenario "Preenchendo o form com Sucesso Com Genêro Masculino" do

    form_page = FormPage.new
    form_page.open
    form_page.fill_form_name(name)
    form_page.fill_form_email(email)
    form_page.fill_form_site(site)
    form_page.fill_form_comment(text)
    form_page.choose_form_gender_male
    form_page.button_form_submit

    expect(page).to have_text "Your Input:"
    
    expect(page).to have_text(name)
    expect(page).to have_text(email)
    expect(page).to have_text(site)
    expect(page).to have_text(text)
    expect(page).to have_text("Male")

  end

  scenario "Preenchendo o form com Sucesso Com Genêro Feminino" do
    
    form_page = FormPage.new
    form_page.open
    form_page.fill_form_name(name)
    form_page.fill_form_email(email)
    form_page.fill_form_site(site)
    form_page.fill_form_comment(text)
    form_page.choose_form_gender_female
    form_page.button_form_submit

    expect(page).to have_text "Your Input:"
    
    expect(page).to have_text(name)
    expect(page).to have_text(email)
    expect(page).to have_text(site)
    expect(page).to have_text(text)
    expect(page).to have_text("Female")
  end

  scenario "Validando Campo Name Obrigatório" do
    
    form_page = FormPage.new
    form_page.open
    form_page.fill_form_email(email)
    form_page.fill_form_site(site)
    form_page.fill_form_comment(text)
    form_page.choose_form_gender_female
    form_page.button_form_submit

    expect(page).to have_text "Name is required"
  end

  scenario "Validando Campo Genero Obrigatório" do

    form_page = FormPage.new
    form_page.open
    form_page.fill_form_name(name)
    form_page.fill_form_email(email)
    form_page.fill_form_site(site)
    form_page.fill_form_comment(text)
    form_page.button_form_submit

    expect(page).to have_text "Gender is required"
  end

  scenario "Validando Campo Email Obrigatório" do

    form_page = FormPage.new
    form_page.open
    form_page.fill_form_name(name)
    form_page.fill_form_site(site)
    form_page.fill_form_comment(text)
    form_page.choose_form_gender_female
    form_page.button_form_submit

    expect(page).to have_text "Email is required"
  end
  
  scenario "Validando Campo Site com o formato de URL web" do

    form_page = FormPage.new
    form_page.open
    form_page.fill_form_name(name)
    form_page.fill_form_email(email)
    form_page.fill_form_site("umteste")
    form_page.fill_form_comment(text)
    form_page.choose_form_gender_female
    form_page.button_form_submit

    expect(page).to have_text "Invalid URL"
  end

end
