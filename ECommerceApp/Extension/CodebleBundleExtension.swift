//
//  CodebleBundleExtension.swift
//  AnimalApp
//
//  Created by Mohak Parmar on 03/08/21.
//

import Foundation

extension Bundle {

    func decode<T : Codable>(_ file:String) -> T {
        // locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate")
        }
        
        // create property
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file")
        }
        
        // create decoder
        let decoder = JSONDecoder()
       
        // create property to decode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode")
        }

        return loaded
    }
}
