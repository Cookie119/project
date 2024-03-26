require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/weekly_timetables", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # WeeklyTimetable. As you add validations to WeeklyTimetable, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      WeeklyTimetable.create! valid_attributes
      get weekly_timetables_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      weekly_timetable = WeeklyTimetable.create! valid_attributes
      get weekly_timetable_url(weekly_timetable)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_weekly_timetable_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      weekly_timetable = WeeklyTimetable.create! valid_attributes
      get edit_weekly_timetable_url(weekly_timetable)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new WeeklyTimetable" do
        expect {
          post weekly_timetables_url, params: { weekly_timetable: valid_attributes }
        }.to change(WeeklyTimetable, :count).by(1)
      end

      it "redirects to the created weekly_timetable" do
        post weekly_timetables_url, params: { weekly_timetable: valid_attributes }
        expect(response).to redirect_to(weekly_timetable_url(WeeklyTimetable.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new WeeklyTimetable" do
        expect {
          post weekly_timetables_url, params: { weekly_timetable: invalid_attributes }
        }.to change(WeeklyTimetable, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post weekly_timetables_url, params: { weekly_timetable: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested weekly_timetable" do
        weekly_timetable = WeeklyTimetable.create! valid_attributes
        patch weekly_timetable_url(weekly_timetable), params: { weekly_timetable: new_attributes }
        weekly_timetable.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the weekly_timetable" do
        weekly_timetable = WeeklyTimetable.create! valid_attributes
        patch weekly_timetable_url(weekly_timetable), params: { weekly_timetable: new_attributes }
        weekly_timetable.reload
        expect(response).to redirect_to(weekly_timetable_url(weekly_timetable))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        weekly_timetable = WeeklyTimetable.create! valid_attributes
        patch weekly_timetable_url(weekly_timetable), params: { weekly_timetable: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested weekly_timetable" do
      weekly_timetable = WeeklyTimetable.create! valid_attributes
      expect {
        delete weekly_timetable_url(weekly_timetable)
      }.to change(WeeklyTimetable, :count).by(-1)
    end

    it "redirects to the weekly_timetables list" do
      weekly_timetable = WeeklyTimetable.create! valid_attributes
      delete weekly_timetable_url(weekly_timetable)
      expect(response).to redirect_to(weekly_timetables_url)
    end
  end
end