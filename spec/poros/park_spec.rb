require 'rails_helper'

RSpec.describe Park do
  it 'exists and has attributes' do
    attributes = {
      fullName: 'Rocky Mountain National Park',
      parkCode: 'romo',
      description: 'Wow! Look at all these mountains.',
      activities: [
        { id: '1234', name: 'Climbing' }
      ],
      contacts: { phoneNumbers: [{ phoneNumber: "9705861206" }] },
      entranceFees: [{
        cost: "25.00",
        description: "Valid for date of purchase. Covers single, non-commercial vehicle with capacity of less than 16 passengers.",
        title: "1-Day Pass - Automobile"
        }],
      directionsInfo: 'drive there',
      operatingHours: [{
        description: "While certain roads and facilities may be closed, the park is open 24 hours a day, 365 days a year.",
        standardHours: {
          wednesday: "All Day",
          monday: "All Day",
          thursday: "All Day",
          sunday: "All Day",
          tuesday: "All Day",
          friday: "All Day",
          saturday: "All Day"
        },
        name: "Rocky Mountain National Park"
      }],
      images: [{
        url: "https://www.nps.gov/common/uploads/structured_data/3C7ECCCF-1DD8-B71B-0B4CB4FB1834BC1D.jpg"
        }],
        states: 'CO'
    }
    park = Park.new(attributes)

    expect(park).to be_an_instance_of(Park)
    expect(park.name).to eq(attributes[:fullName])
    expect(park.id).to eq(attributes[:parkCode])
    expect(park.description).to eq(attributes[:description])
    expect(park.activities).to eq(attributes[:activities])
    expect(park.contacts).to eq(attributes[:contacts])
    expect(park.directions).to eq(attributes[:directionsInfo])
    expect(park.operating_hours).to eq(attributes[:operatingHours])
    expect(park.images).to eq(attributes[:images])
    expect(park.states).to eq(['CO'])
  end

  it 'exists and has attributes' do
    attributes = {
      fullName: 'Rocky Mountain National Park',
      parkCode: 'romo',
      description: 'Wow! Look at all these mountains.',
      activities: [
        { id: '1234', name: 'Climbing' }
      ],
      contacts: { phoneNumbers: [{ phoneNumber: "9705861206" }] },
      entranceFees: [{
        cost: "25.00",
        description: "Valid for date of purchase. Covers single, non-commercial vehicle with capacity of less than 16 passengers.",
        title: "1-Day Pass - Automobile"
        }],
      directionsInfo: 'drive there',
      operatingHours: [{
        description: "While certain roads and facilities may be closed, the park is open 24 hours a day, 365 days a year.",
        standardHours: {
          wednesday: "All Day",
          monday: "All Day",
          thursday: "All Day",
          sunday: "All Day",
          tuesday: "All Day",
          friday: "All Day",
          saturday: "All Day"
        },
        name: "Rocky Mountain National Park"
      }],
      images: [{
        url: "https://www.nps.gov/common/uploads/structured_data/3C7ECCCF-1DD8-B71B-0B4CB4FB1834BC1D.jpg"
        }],
        states: 'CO,WY'
    }
    park = Park.new(attributes)

    expect(park).to be_an_instance_of(Park)
    expect(park.name).to eq(attributes[:fullName])
    expect(park.id).to eq(attributes[:parkCode])
    expect(park.description).to eq(attributes[:description])
    expect(park.activities).to eq(attributes[:activities])
    expect(park.contacts).to eq(attributes[:contacts])
    expect(park.directions).to eq(attributes[:directionsInfo])
    expect(park.operating_hours).to eq(attributes[:operatingHours])
    expect(park.images).to eq(attributes[:images])
    expect(park.states).to eq(['CO', 'WY'])
  end
end
