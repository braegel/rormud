# encoding: utf-8

Room.delete_all
Exit.delete_all

Room.create(
  :name => "Ein langer dunkler Flur",
  :description => "Vor dir liegt ein langer dunkler Flur. Am Ende des Flures befindet sich eine Stahltür mit der Aufschrift 'Anmeldung'"
)

Room.create(
  :name => "Anmeldung",
  :description => "Du befindest Dich in einem kleinen Zimmer mit strahlend hellem Licht."
)

Exit.create(
  :room_id => Room.where(:name => "Ein langer dunkler Flur").first.id,
  :to_room => Room.where(:name => "Anmeldung").first.id,
  :name => "Stahltür am Ende des Flures"
)

Exit.create(
  :room_id => Room.where(:name => "Anmeldung").first.id,
  :to_room => Room.where(:name => "Ein langer dunkler Flur").first.id,
  :name => "Stahltür"
)