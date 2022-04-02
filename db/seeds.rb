# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Campaign.destroy_all

# generate 20 campaigns
(1..20).each do |id|
  campaign =
    Campaign.create!(
      id: id,
      name: "Campaign #{id}",
      target_amount: [100000, 150000, 300000].sample,
      investment_multiple: 10000,
      sector: ['IT', 'Food', 'Medicine'].sample,
      country: ['Bangladesh', 'England', 'Australia', 'India'].sample,
    )
  campaign.image.attach(io: File.open(Rails.root.join('app/assets/images/campaign.jpg')),
                        filename: 'cat.jpg')
end

puts "Created #{Campaign.count} campaigns"
