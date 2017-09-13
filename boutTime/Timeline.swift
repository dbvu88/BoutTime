//
//  Timeline.swift
//  boutTime
//
//  Created by Duc Vu on 9/10/17.
//  Copyright © 2017 Duc Vu. All rights reserved.
//
import GameKit

class Event {
    let year: Int
    let description: String
    
    init(description: String, year: Int) {
        self.description = description
        self.year = year
    }
}

let historicEvents:[Event] = [
    Event(description: "Lugi Galvani is able to show electricty activity in living tissue, including muscle and nerve.", year: 1780),
    Event(description: "Nicolas Appert invents a vacuum bottling technique that helps supply food for French Troops.", year: 1809),
    Event(description: "Refrigeration starts to become popular in food processing.", year: 1892),
    Event(description: "Jack Kilby and Robert Noyce develop the intergrated circuit paving the way for microprocessor technology.", year: 1958),
    Event(description: "Bob Kahn and Vint Cerf create the transmission control protocal (TCP) that controls how data moves around the internet.", year: 1973),
    Event(description: "Tim Bernes-Lee proposes a hypertext system that will run across the internet on different operating systems.", year: 1989),
    Event(description: "Karl Benz builds an automobile powered by his own four-stroke engine design.", year: 1885),
    Event(description: "Brothers Charles and Frank Duryea test the first-ever American gasoline-powered automobile.", year: 1893),
    Event(description: "Ford introduces airpags.", year: 1974),
    Event(description: "Ford, Chrysler and GM offer seat belts as options.", year: 1956),
    Event(description: "Four-wheel brakes are introduced in Scotland.", year:1909),
    Event(description: "Kane Kramer creates an MP3 Player called MPMan player.", year: 1997),
    Event(description: "Apple and Steve Jobs introduce iTunes and the iPod.", year: 2001),
    Event(description: "German researches begin work on a File Format for digitizing audio.", year: 1987),
    Event(description: "Sony introduces the first version of its iconic walkman personal music device.", year: 1979),
    Event(description: "Martin Cooper makes the first analog mobile phone call using a blocky handset.", year: 1973),
    Event(description: "AT&T submits a concept for cellular communication to the federal communications commission.", year: 1971),
    Event(description: "The first person-to-person SMS is sent.", year: 1993),
    Event(description: "Apple releases the macintosh, the first successful mouse-driven user interface.", year: 1984),
    Event(description: "Atari introduces the 400 and 800 computers.", year: 1979),
    Event(description: "Konrad Zuse creates the Z3, the first fully operational, programmable electro-machanical computer.", year: 1941),
    Event(description: "Louis Pasteur develops a method that dramatically improves the safety of food, allowing for longer preservation.", year: 1832),
    Event(description: "Peter Duran introduces the tin-plated can in the U.S.", year: 1818),
    Event(description: "John Deere invents the steel plough, allowing farmers to produce more crops.", year: 1832),
    Event(description: "The Boeing 707 offers a new level of comfort and safety.", year: 1958)]

class eventsController {
    var selectedEvents: [Event]
    
    init(events: [Event]) {
        selectedEvents = []
        var availableEvents: [Event] = events
        while selectedEvents.count < 4 {
            let index:Int = GKRandomSource.sharedRandom().nextInt(upperBound: availableEvents.count)
            selectedEvents.append(availableEvents[index])
            availableEvents.remove(at: index)
        }
    }
    
    func eventSwapper(firstPosition: Int, secondPosition: Int){
        let tempEvent: Event = selectedEvents[secondPosition]
        selectedEvents[secondPosition] = selectedEvents[firstPosition]
        selectedEvents[firstPosition] = tempEvent
    }
    
    func eventDescription(at index: Int) -> String {
        return selectedEvents[index].description
    }
    
    func isInAscendingOrder() -> Bool {
        let result: Bool = (
            selectedEvents[0].year < selectedEvents[1].year &&
            selectedEvents[1].year < selectedEvents[2].year &&
            selectedEvents[2].year < selectedEvents[3].year)
        return result
    }
}


