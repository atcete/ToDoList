//
//  ToDo.swift
//  ToDoList.Tezer
//
//  Created by Nathan Tezer on 14/03/24.
//
//On my honor, I have neither received nor given any unauthorized assistance on this assignment." Nathan Tezer

import UIKit

struct ToDo: Codable{
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func loadToDos() -> [ToDo]?  {
        // geting data from the disk
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else {return nil}
        
        // Initialising **PropertyListDecoder** to decode the PropertyList file
        let propertyListDecoder = PropertyListDecoder()
        
        // returning the array of ToDo object after decoding from codedToDos
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        // Initialising **PropertyListDecoder** to encode the PropertyList file
        let propertyListEncoder = PropertyListEncoder()
        
        // now edcoding the **todos**
        let codedToDos = try? propertyListEncoder.encode(todos)
        
        // Now saving the data to the disk
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    //Inside ToDo type definition
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
 
    static func loadSampleToDo() -> [ToDo]{
        let todo1 = ToDo(title: "To-Do One", isComplete: false, dueDate: Date(), notes: "Make this final project ")
        let todo2 = ToDo(title: "To-Do Two", isComplete: false, dueDate: Date(), notes: "Control this final project ")
        let todo3 = ToDo(title: "To-Do Three", isComplete: false, dueDate: Date(), notes: " Present this final project ")
        
        return [todo1, todo2, todo3]
    }
}
