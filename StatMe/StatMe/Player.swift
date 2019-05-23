//
//  ListOfPlayers.swift
//  StatMe
//
//  Created by CJ on 5/16/19.
//  Copyright © 2019 CJ. All rights reserved.
//

import Foundation
import UIKit
let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

struct Player:Codable {
    var name: String
    var position: String 
    var number: Int
    var shotsmade: Int
    var shotsattempted: Int
    
}
