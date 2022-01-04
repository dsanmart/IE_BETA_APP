//
//  JSONDataService.swift
//  IE App
//
//  Created by Diego Sanmartin on 24/12/2021.
//

import Foundation

class DataService {
    
    static func getlocaldata() -> [User] {
        
        // Parse local json file
        
        // Get a url object
        let pathString = Bundle.main.path(forResource: "users", ofType: "json") // This method returns an optional string (pathString?)
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [User]() // returns empty recipe list if it cant find a path to the json file
        }
        
        // Create a data object
        let url = URL(fileURLWithPath: pathString!) // We can safely unwrap pathString since we already checked that it's not nil
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            
            do { // Not necessary but lets you differentiate between errors
                
                let Userdata = try decoder.decode([User].self, from: data)
            
                // Add the unique IDs
                for user in Userdata { // For every user
                    
                    // Access courses in blackboard
                    for course in user.blackboardData.courses {
                        
                        // Add unique IDs to roster members
                        for var i in course.roster {
                            i.id = UUID()
                        }
                        // Add unique IDs to attendance meetings
                        for var k in course.attendance {
                            k.id = UUID()
                        }
                        // Add unique IDs to announcements
                        for var j in course.announcements {
                            j.id = UUID()
                        }
                        // Add unique IDs to assignments
                        for var l in course.assignment {
                            l.id = UUID()
                        }
                    }
                }
                print("Succesfully parsed JSON")
                // Return the User
                return Userdata
                
            } catch {
                // Error with parsing JSON
                print("Error with parsing JSON: ", error)
            }
        } catch {
            // error with getting data
            print(error)
        }
        return [User]() // If it ever gets to this point it will return an empty array of Users because it is mandatory to return the User instance
    }
    
}

