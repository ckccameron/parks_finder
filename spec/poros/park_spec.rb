require 'rails_helper'

describe Park do
  before :each do
    @park_info = {
                  id: "FAEF5684-83A4-4CF2-A701-60CF8D4014BD",
                  name: "Appalachian National Scenic Trail",
                  description: "The Appalachian Trail is a 2,180+ mile long public footpath that traverses the scenic, wooded, pastoral, wild, and culturally resonant lands of the Appalachian Mountains. Conceived in 1921, built by private citizens, and completed in 1937, today the trail is managed by the National Park Service, US Forest Service, Appalachian Trail Conservancy, numerous state agencies and thousands of volunteers.",
                  directions: "There are many points of access along the Appalachian Trail, whether it is by car, train, bus or plane. For more detailed directions, please refer to the \"Directions\" section of our park webpage.",
                  standard_hours: {
                                    "wednesday": "All Day",
                                    "monday": "All Day",
                                    "thursday": "All Day",
                                    "sunday": "All Day",
                                    "tuesday": "All Day",
                                    "friday": "All Day",
                                    "saturday": "All Day"
                                  }
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
                                        "wednesday": "All Day",
                                        "monday": "All Day",
                                        "thursday": "All Day",
                                        "sunday": "All Day",
                                        "tuesday": "All Day",
                                        "friday": "All Day",
                                        "saturday": "All Day"
                                      })
  end
end
