blue1 = Train.find_or_create_by(line_color: "Blue", series: "7000" ,cars: 6, destination_name: "Largo Town Center")
red1 = Train.find_or_create_by(line_color: "Red", series: "6000" ,cars: 8, destination_name: "Glenmont")
silver1 = Train.find_or_create_by(line_color: "Silver", series: "6000" ,cars: 4, destination_name: "Largo Town Center")
orange1 = Train.find_or_create_by(line_color: "Orange", series: "3000" ,cars: 8, destination_name: "Vienna")

rosslyn = Station.find_or_create_by(name:"Rosslyn")
stadium = Station.find_or_create_by(name:"Stadium-Armory")
mtvernon = Station.find_or_create_by(name:"Mt. Vernon")
waterfront = Station.find_or_create_by(name:"Waterfront")
metrocenter = Station.find_or_create_by(name:"Metro Center")

blue1.stations <<[rosslyn,metrocenter,stadium]
red1.stations << metrocenter
silver1.stations <<[rosslyn,metrocenter,stadium]
orange1.stations <<[rosslyn,metrocenter,stadium]