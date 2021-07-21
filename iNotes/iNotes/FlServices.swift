//
//  FlServices.swift
//  iNotes
//
//  Created by Nick patel on 21/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation
class FlServices {
    
    static func getDocDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print("Doc Dir: \(paths[0])")
        return paths[0]
    }
}
