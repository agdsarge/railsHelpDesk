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

ticket1 = Ticket.create(description: "routers", open: true, client: pn, professional: frodo)
ticket2 = Ticket.create(description: "routers", open: true, client: sn, professional: pippin)
ticket3 = Ticket.create(description: "surge protectors", open: true, client: ag, professional: sam)
ticket4 = Ticket.create(description: "surge protectors", open: true, client: as, professional: bilbo)
ticket5 = Ticket.create(description: "wifi", open: true, client: ds, professional: merry)
ticket6 = Ticket.create(description: "modem", open: true, client: ep, professional: fredegar)

comment1 = Comment.create(text: "My wifi no work.", ticket: ticket5, internal: false, username: "d.sargeant")
comment2 = Comment.create(text: "Hey, is the router plugged in?", ticket: ticket5, internal: false, username: "m.brandybuck")
comment3 = Comment.create(text: "Idk what a plug is.", ticket: ticket5, internal: false, username: "d.sargeant")
comment4 = Comment.create(text: "Client appears to be a high functioning idiot.", ticket: ticket5, internal: true, username: "m.brandybuck")
comment5 = Comment.create(text: "Solved the problem by plugging in router.", ticket: ticket5, internal: false, username: "m.brandybuck")

comment11 = Comment.create(text: "There is a red blinking light on my router.", ticket: ticket1, internal: false, username: "p.nicholsen")
comment12 = Comment.create(text: "Hey, is the ethernet cable plugged into the modem?", ticket: ticket1, internal: false, username: "f.baggins")
comment13 = Comment.create(text: "Yes. I am not an idiot!  In fact, I know everything.", ticket: ticket1, internal: false, username: "p.nicholsen")
comment14 = Comment.create(text: "Look at this guy.  Claims he knows everything but needs to ask us how to fix the router.", ticket: ticket1, internal: false, username: "f.baggins")
comment15 = Comment.create(text: "Whoops, that was supposed to be internal.", ticket: ticket1, internal: true, username: "f.baggins")
comment16 = Comment.create(text: "Well, Green Leaf Squad has just lost my business.  Adieu!", ticket: ticket1, internal: false, username: "p.nicholsen")

comment21 = Comment.create(text: "Hey, so my router caught fire. Can I have a new one?", ticket: ticket2, internal: false, username: "s.nabors")
comment22 = Comment.create(text: "How did it catch fire?", ticket: ticket2, internal: false, username: "p.took")
comment23 = Comment.create(text: "My code was too powerful for the router.", ticket: ticket2, internal: false, username: "s.nabors")
comment24 = Comment.create(text: "Seems legit.", ticket: ticket2, internal: true, username: "p.took")
comment25 = Comment.create(text: "Absolutely.  We will send you one ASAP.  Sorry for the inconvenience.", ticket: ticket2, internal: false, username: "p.took")

comment31 = Comment.create(text: "This third gym is really tough.  What should I do?", ticket: ticket3, internal: false, username: "a.gautherin")
comment32 = Comment.create(text: "Mr. Alex, I don't understand. I am just a gardener.", ticket: ticket3, internal: false, username: "s.gamgee")
comment33 = Comment.create(text: "My team keeps fainting to his right shoe.", ticket: ticket3, internal: false, username: "a.gautherin")
comment34 = Comment.create(text: "Can anyone help me with this?", ticket: ticket3, internal: true, username: "s.gamgee")
comment35 = Comment.create(text: "Tell him to go to the cave east of the city.", ticket: ticket3, internal: true, username: "m.brandybuck")
comment36 = Comment.create(text: "Check out the cave east of the city.", ticket: ticket3, internal: false, username: "s.gamgee")
comment37 = Comment.create(text: "Thanks!  Now I have a Thunder Badge!", ticket: ticket3, internal: false, username: "a.gautherin")


comment41 = Comment.create(text: "I don't actually have a problem.  I am just checking out your website.", ticket: ticket4, internal: false, username: "a.sharma")
comment42 = Comment.create(text: "Thanks so much.  Have a good day.", ticket: ticket4, internal: false, username: "b.baggins")
comment43 = Comment.create(text: "What a meddle-some person.", ticket: ticket4, internal: true, username: "b.baggins")
comment44 = Comment.create(text: "LAWL.  Your security is weak.", ticket: ticket4, internal: true, username: "a.sharma")

comment51 = Comment.create(text: "Is this where I pre-order the new game?", ticket: ticket6, internal: false, username: "e.pittaluga")
comment52 = Comment.create(text: "I am sorry.  I do not understand.", ticket: ticket6, internal: false, username: "f.bulger")
comment53 = Comment.create(text: "Is this not where I get Call of Duty: Modem Warfare?", ticket: ticket6, internal: false, username: "e.pittaluga")
comment54 = Comment.create(text: "Reminds me of my dad.", ticket: ticket6, internal: true, username: "f.bulger")



