//
//  ContentView.swift
//  SwiftIDDevChallenge1
//
//  Created by Nico Prananta on 04.09.21.
//

import SwiftUI

struct Joke: Codable {
  let id: Int
  let setup, type, punchline: String
}

typealias Jokes = [Joke]

let url = "https://official-joke-api.appspot.com/jokes/ten"

let darkColor = Color(
  red:  51/255,
  green: 51/255,
  blue:  54/255)

extension URL {
  enum DataError: Error {
    case empty(String)
  }
  func json<T>(_ type: T.Type) throws -> T where T : Decodable  {
    let content = try String(contentsOf: self)
    let data = content.data(using: .utf8)
    if let d = data {
      let obj = try JSONDecoder().decode(type, from: d)
      return obj
    }
    throw DataError.empty("Data is empty")
  }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
