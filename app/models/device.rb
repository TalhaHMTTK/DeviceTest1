class Device < ApplicationRecord
  enum model: { 
    macbook_air: 0,
    macbook_pro: 1,
    hp_spectre_x360: 2,
    dell_xps_13: 3,
    surface_pro: 4,
    surface_laptop: 5,
    ipad_pro: 6,
    ipad_air: 7,
    samsung_galaxy_tab: 8,
    google_pixelbook: 9,
    asus_zenbook: 10,
    lenovo_thinkpad: 11,
    razer_blade: 12,
    acer_predator: 13,
    msi_stealth: 14
  }

  belongs_to :location
  has_many :tests
  acts_as_tenant(:company)
end
