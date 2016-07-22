{state_id: 1, town_id: 1, area_id: 1, street_id: 1},

areas = Area.all
areas.map do |area|
  {state_id: area.state.id, town_id: area.town.id, area_id: area.id, street_id: 1}
end
