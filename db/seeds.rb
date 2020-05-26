# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.destroy_all
Comment.destroy_all
Isp.destroy_all
Professional.destroy_all
Ticket.destroy_all

vz = Isp.create(name: 'Verizon FiOS', email: 'support@verizon.com')
cx = Isp.create(name: 'Cox Cable', email: 'help@cox.com')
cc = Isp.create(name: 'Comcast', email: 'tech_desk@comcast.com')
el = Isp.create(name: "EarthLink", email: 'geeks@earthlink.net')
sp = Isp.create(name: "Spectrum", email: "help@spectrum.com")


pn = Client.create(name: 'Paul Nicholsen', username: "p.nicholsen", password: "password", phone_number: '202 555 5678', email: 'p.nicholsen@flatiron.com', home_address: '1600 Pennsylvania Ave', isp_id: vz.id)
sn = Client.create(name: 'Shannon Nabors', username: "s.nabors", password: "password", phone_number: '202 555 6543', email: 's.nabors@flatiron.com', home_address: '1440 G St. NW', isp_id: cx.id)
ep = Client.create(name: 'Enrique Pittaluga', username: "e.pittaluga", password: "password", phone_number: '202 555 0965', email: 'e.pittaluga@flatiron.com', home_address: '1438 G St. NW', isp_id: cc.id)
as = Client.create(name: 'Abhinav Sharma', username: "a.sharma", password: "password", phone_number: '202 555 3965', email: 'a.sharma@flatiron.com', home_address: '1436 G St. NW', isp_id: cc.id)
ag = Client.create(name: 'Alex Gautherin', username: "a.gautherin", password: "password", phone_number: '202 555 0879', email: 'a.gautherin@flatiron.com', home_address: '1434 G St. NW', isp_id: vz.id)
ds = Client.create(name: 'Davis Sargeant', username: "d.sargeant", password: "password", phone_number: '202 555 0182', email: 'd.sargeant@flatiron.com', home_address: '1432 G St. NW', isp_id: cx.id)
sa = Client.create(name: 'Saima Akhtar', username: "s.akhtar", password: "password", phone_number: '202 555 5432', email: 's.akhtar@flatiron.com', home_address: '1430 G St. NW', isp_id: el.id)
mo = Client.create(name: 'Mert Ozkaynak', username: "m.ozkaynak", password: "password", phone_number: '202 555 8899', email: 'm.ozkaynak@flatiron.com', home_address: '1428 G St. NW', isp_id: sp.id)
jb = Client.create(name: 'Josh Beglan', username: "j.beglan", password: "password", phone_number: '202 555 1212', email: 'j.beglan@flatiron.com', home_address: '1426 G St. NW', isp_id: vz.id)
jl = Client.create(name: 'Jesse Langley', username: "j.langley", password: "password", phone_number: '202 555 9115', email: 'j.langley@flatiron.com', home_address: '1424 G St. NW', isp_id: cc.id)
ta = Client.create(name: 'Tomazye Anderson', username: "t.anderson", password: "password", phone_number: '202 555 7531', email: 't.anderson@flatiron.com', home_address: '1424 G St. NW', isp_id: cx.id)
il = Client.create(name: 'Injae Lee', username: "i.lee", password: "password", phone_number: '202 555 1238', email: 'i.lee@flatiron.com', home_address: '1422 G St. NW', isp_id: vz.id)

frodo = Professional.create(name: "Frodo Baggins", username: 'f.baggins', password: "password", specialty: 'routers', email: 'f.baggins@greenleaf.com')
sam = Professional.create(name: "Samwise Gamgee", username: 's.gamgee', password: "password", specialty: 'surge protectors', email: 's.gamgee@greenleaf.com')
merry = Professional.create(name: "Merry Brandybuck", username: 'm.brandybuck', password: "password", specialty: 'wifi', email: 'm.brandybuck@greenleaf.com')
pippin  = Professional.create(name: "Pippin Took", username: 'p.took', password: "password", specialty: 'routers', email: 'p.took@greenleaf.com')
bilbo = Professional.create(name: "Bilbo Baggins", username: 'b.baggins', password: "password", specialty: 'surge protectors', email: 'b.baggins@greenleaf.com')
fredegar = Professional.create(name: "Fredegar Bulger", username: 'f.bulger', password: "password", specialty: 'modem', email: 'f.bulger@greenleaf.com')
