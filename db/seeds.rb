
owner = User.first
now = Time.zone.now

99.times do |i|
  event = Event.new(
    name: "The event No.#{i}",
    owner_id: owner.id,
    start_time: now + 5.months,
    end_time: now + 1.year,
    place: "place-#{i}",
    content: "This is an event ##{i}!"
  )
  event.save!
end
