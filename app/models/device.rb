class Device < ApplicationRecord
  include Tenantable
  
  belongs_to :location
  has_many :tests

  enum model: {
    hose_guage: 0,
    pitotless_nozzle: 1,
    in_line_pitotless_nozzle: 2,
    pitotless_nozzles: 3,
    adjustable_nozzle: 4,
    high_pressure_nozzle: 5,
    low_pressure_nozzle: 6,
    foam_nozzle: 7,
    water_cannon: 8,
    foam_cannon: 9,
    turret_nozzle: 10,
    mist_nozzle: 11,
    jet_nozzle: 12,
    spray_nozzle: 13,
    deluge_nozzle: 14
  }
end
