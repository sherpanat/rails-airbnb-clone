class Family < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :customers, through: :bookings
  has_attachment :photo, presence: true

  validates :name, presence: true
  validates :country_origin, presence: true
  validates :city, presence: true
  validates :pension, presence: true, inclusion: { in: %w(half-board full-board all-inclusive), message: "%{value} must be half-board, full-board or all-inclusive" }
  # validates :photo, presence: true
  # validates :churchgoer
  # validates :swinger
  # validates :members
  geocoded_by :country_origin
  after_validation :geocode, if: :country_origin_changed?

  COUNTRIES = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla",
  "Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands",
  "Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica",
  "Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea",
  "Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana",
  "Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India",
  "Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia",
  "Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania",
  "Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia",
  "New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal",
  "Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles",
  "Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","St. Lucia","Sudan",
  "Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia",
  "Turkey","Turkmenistan","Turks & Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]

  URL_LIST = ['http://res.cloudinary.com/malquoi/image/upload/v1510916085/sweden_tax5nm.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916085/mormon_noy965.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916085/russia_oy6auf.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916085/singapore_pcd3z5.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916085/pakistan_wryhjd.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916084/china_pmfe1a.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916084/barbie_wxuvjy.png',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916084/mongolia_be3y3p.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916084/lithuania_enagpu.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916084/mauritius_sfpi6z.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916083/bulgaria_dgon8x.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916083/argentina_nxqzee.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916083/america_dofufu.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510916083/brazil_u7faat.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510849048/eemtv03w3ckn1ked5kpy.jpg',
    'http://res.cloudinary.com/malquoi/image/upload/v1510847813/lbvvsdztyaoqf7xfuwjr.jpg']
end
