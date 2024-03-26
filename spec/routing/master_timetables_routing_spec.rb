require "rails_helper"

RSpec.describe MasterTimetablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/master_timetables").to route_to("master_timetables#index")
    end

    it "routes to #new" do
      expect(get: "/master_timetables/new").to route_to("master_timetables#new")
    end

    it "routes to #show" do
      expect(get: "/master_timetables/1").to route_to("master_timetables#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/master_timetables/1/edit").to route_to("master_timetables#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/master_timetables").to route_to("master_timetables#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/master_timetables/1").to route_to("master_timetables#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/master_timetables/1").to route_to("master_timetables#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/master_timetables/1").to route_to("master_timetables#destroy", id: "1")
    end
  end
end
