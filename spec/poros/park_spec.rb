require 'rails_helper'

describe Park do
  before :each do
    @park_info = {
                  id: "FAEF5684-83A4-4CF2-A701-60CF8D4014BD",
                  fullName: "Appalachian National Scenic Trail",
                  description: "The Appalachian Trail is a 2,180+ mile long public footpath that traverses the scenic, wooded, pastoral, wild, and culturally resonant lands of the Appalachian Mountains. Conceived in 1921, built by private citizens, and completed in 1937, today the trail is managed by the National Park Service, US Forest Service, Appalachian Trail Conservancy, numerous state agencies and thousands of volunteers.",
                  directionsInfo: "There are many points of access along the Appalachian Trail, whether it is by car, train, bus or plane. For more detailed directions, please refer to the \"Directions\" section of our park webpage.",
                  operatingHours:
                                [{exceptions:
                                [{exceptionHours: {},
                                  startDate: "2021-01-01",
                                  name: "Closed New Year's Day",
                                  endDate: "2021-01-01"},
                                  {exceptionHours: {},
                                  startDate: "2020-11-26",
                                  name: "Closed for Thanksgiving",
                                  endDate: "2020-11-26"},
                                  {exceptionHours: {},
                                  startDate: "2020-12-25",
                                  name: "Closed for Christmas Day",
                                  endDate: "2020-12-25"}],
                                  description: "Following guidance from the White House, Centers for Disease Control and Prevention, and state and local public health authorities, the Andrew Johnson NHS is increasing access and services in a phased approach. The site is currently open from 10:00 a.m. until 3:00 p.m. Monday - Friday only. Due to the limited space inside the president's Homestead, tours are cancelled until further notice.",
                                  standardHours:
                                   {wednesday: "10:00AM - 3:00PM",
                                    monday: "10:00AM - 3:00PM",
                                    thursday: "10:00AM - 3:00PM",
                                    sunday: "Closed",
                                    tuesday: "10:00AM - 3:00PM",
                                    friday: "10:00AM - 3:00PM",
                                    saturday: "Closed"},
                                  :name=>"Andrew Johnson National Historic Site"}]
                  }
    @park = Park.new(@park_info)
  end

  it "exists with attributes" do
    expect(@park).to be_a(Park)
    expect(@park.id).to eq("FAEF5684-83A4-4CF2-A701-60CF8D4014BD")
    expect(@park.name).to eq("Appalachian National Scenic Trail")
    expect(@park.description).to eq("The Appalachian Trail is a 2,180+ mile long public footpath that traverses the scenic, wooded, pastoral, wild, and culturally resonant lands of the Appalachian Mountains. Conceived in 1921, built by private citizens, and completed in 1937, today the trail is managed by the National Park Service, US Forest Service, Appalachian Trail Conservancy, numerous state agencies and thousands of volunteers.")
    expect(@park.directions).to eq("There are many points of access along the Appalachian Trail, whether it is by car, train, bus or plane. For more detailed directions, please refer to the \"Directions\" section of our park webpage.")
    expect(@park.standard_hours).to eq({
                                        wednesday: "10:00AM - 3:00PM",
                                        monday: "10:00AM - 3:00PM",
                                        thursday: "10:00AM - 3:00PM",
                                        sunday: "Closed",
                                        tuesday: "10:00AM - 3:00PM",
                                        friday: "10:00AM - 3:00PM",
                                        saturday: "Closed"})
  end
end
