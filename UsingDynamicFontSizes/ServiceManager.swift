//
//  ServiceManager.swift
//  UsingDynamicFontSizes
//
//  Created by Andy Nadal on 26/01/22.
//

import Foundation

enum ServiceManager {
    static func fetchComments(_ callBack: @escaping ([Comment]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Didn't get a 200 status response")
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }

            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                callBack(comments)
            } catch {
                print("Couldn't decode JSON", error)
            }
        }
        
        task.resume()
    }
    
    static func fetchPhotos(_ callBack: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Didn't get a 200 status response")
                callBack([])
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
                callBack([])
                return
            }
            
            guard let data = data else {
                callBack([])
                return
            }

            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                callBack(photos)
            } catch {
                print("Couldn't decode JSON", error)
            }
        }
        
        task.resume()
    }
}
