## ruby C:\Users\IBM_ADMIN\RubymineProjects\Test\cohorts_spec.rb  -e 'should Save Cohorts' --format documentation --out testlog.txt
require 'C:\Users\IBM_ADMIN\RubymineProjects\Test\requires.rb'
#require 'rspec/autorun'




RSpec.describe 'Cohort1 Creation on Atmosphere' do

  before(:all) do

  end

  after(:all) do
  sleep 3
  end

  before(:each) do

    open_browser_chrome
    go_to_Coordinate23


  end

  after(:each) do
    ##@browser.quit
    ##@browser.close

    
  end



  it 'Should Save Cohorts' do
    login_coordinate23
    sleep 6
    saved_page_view_arrow.when_present.click
    select_page_view.click
    sleep 4
    first_checkbox_on_a_patient_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.click
    sleep 3
    cohort_name_field.when_present.set (cohortName)
    sleep 2
    cohort_description_field.set('C3P0 Automation Test')
    save_cohort_button.when_present.click
    sleep 2
    #cohort_name_saved
    cohort_saved_successfully_label_validation

    key = WIN32OLE.new('Wscript.Shell')

    key.SendKeys('{^}C{ENTER}')^C


=begin
    sleep 5
    if cohorts==saved_cohort
      puts'Cohort sucessfully saved in the contract database'
    else
      puts'FAIL - Cohort NOT found in the database'
    end
=end
  end

  it 'Save Cohort Without Name' do
    #set_trace_func proc { |event, file, line, id, binding, classname|
     # printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname}
    login_coordinate23
    sleep 6
    first_checkbox_on_a_patient_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.click
    sleep 3
    cohort_description_field.clear
    save_cohort_button.when_present.click
    sleep 3
    atmo_label_validation_saving_cohort_without_name
  end

  it 'Save Cohort With existing Name' do
    login_coordinate23
    sleep 4
    select_patient_search_button.when_present.click
    sleep 3
    select_filter_field.when_present.click
    sleep 2
    select_email_filter.click
    sleep 2
    action_arrow_button.click
    action_dropdown_IsEqualTo.click
    email_filter_field.when_present.set ('phytest56041@testmail.com')
    run_button.when_present.click
    sleep 3
    select_all_from_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.when_present.click
    sleep 3
    cohort_name_field.when_present.when_present.set (get_existing_cohorts)
    sleep 2
    save_cohort_button.when_present.click
    sleep 3
    atmo_label_validation_saving_cohort_with_existing_name

  end

  it 'Save Cohort With Special Characters' do
    lo
    sleep 4
    select_patient_search_button.when_present.click
    sleep 2
    select_filter_field.when_present.click
    sleep 2
    select_email_filter.click
    sleep 2
    action_arrow_button.click
    action_dropdown_IsEqualTo.click
    email_filter_field.when_present.set ('phytest56041@testmail.com')
    run_button.when_present.click
    sleep 3
    select_all_from_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.click
    sleep 3
    cohort_name_field.when_present.when_present.set  ('cohorttest#')
    sleep 2
    save_cohort_button.when_present.click
    sleep 3
    atmo_label_validation_saving_cohort_name_with_special_char

  end

  it 'Cohort exceeding save limit - Label validation ' do
    login_coordinate23
    sleep 5
    saved_page_view_arrow.when_present.click
    select_page_view.click
    sleep 5
    record_per_page_arrow.click
    select_25_records_per_page.click
    sleep 5
    select_all_from_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.click
    cohort_max_allowed_save_label

  end

  it 'Cohort exceeding WCM send limit - Label validation ' do
    login_coordinate23
    sleep 6
    saved_page_view_arrow.when_present.click
    select_page_view_greater_than_84.click
    sleep 2
    select_all_from_grid.when_present.click
    sleep 3
    select_action_button.double_click
    select_save_a_cohort_option.when_present.click
    sleep 3
    cohort_max_allowed_WCM_send_label
  end

  it 'Save Cohort with exceeding WCM send limit' do
    login_coordinate23
    sleep 6
    saved_page_view_arrow.when_present.click
    select_page_view_greater_than_84.click
    sleep 2
    select_all_from_grid.when_present.click
    sleep 3
    select_action_button.double_click
    select_save_a_cohort_option.click
    sleep 3
    cohort_max_allowed_WCM_send_label
    cohort_name_field.when_present.when_present.set  (cohortName)
    sleep 2
    save_cohort_button.when_present.click
    cohort_saved_successfully_label_validation

  end

  it 'Cohort option is only visible to the Authorized users ' do
    login_coordinate23_with_no_cohort_authorization
    sleep 6
    saved_page_view_arrow.exists?
    cohort_option_does_not_exist_for_non_authorized_user

  end

  it 'Send Cohorts successfully - Label Validation' do
    login_coordinate23
    sleep 6
    saved_page_view_arrow.when_present.click
    select_page_view.click
    sleep 4
    first_checkbox_on_a_patient_grid.when_present.click
    sleep 2
    select_action_button.double_click
    select_save_a_cohort_option.click
    sleep 3
    cohort_name_field.when_present.set (cohortName)
    sleep 2
    cohort_description_field.set('C3P0 Automation Test')
    save_cohort_button.when_present.click
    sleep 2
    coordinate_cohort_button.click
    sleep 5
    coordinate_cohort_send_button.when_present.click
    sleep 2
    cohort_successfully_sent_to_WCM_label_validation
  end

 end