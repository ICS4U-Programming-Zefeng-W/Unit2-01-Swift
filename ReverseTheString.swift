/*
  ReverseTheString.swift
  
  By Zefeng Wang
  Created on January 6, 2022
  
  This program uses a recursive function to reverse each string in input.txt
  and outputs it to output.txt

*/

// Import the Foundation module 
import Foundation

// Recursive function to reverse and return a string
func reverse(str: String) -> String {
	if str.count == 0 {
		return str
	} else {
		return reverse(str: String(Array(str)[1...])) + String(Array(str)[0])
	}
}

// Reads information from input.txt
let contents = try String(contentsOfFile: "input.txt")
let strArr = contents.components(separatedBy: "\n").filter { $0 != "" }

// Clears the file
let text = ""
do {
	try text.write(to: URL(fileURLWithPath: "output.txt"), atomically: false,
						encoding: .utf8)
} catch {
	print(error)
}

// Display the data in output.txt
if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "output.txt")) {

	// Display error message
	if strArr.count == 0 {
		fileWriter.write("Please enter at least one string in input.txt"
					.data(using: .utf8)!)
	} else {

		// Displays reversed strings
		for string in strArr {
			fileWriter.seekToEndOfFile()
			fileWriter.write((reverse(str: string) + "\n").data(using: .utf8)!)
		}
	}
	fileWriter.closeFile()
}
