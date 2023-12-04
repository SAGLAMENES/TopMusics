//
//  Helpers.swift
//  TopMusics2API
//
//  Created by Enes Saglam on 3.12.2023.
//

import Foundation

public enum Result<Value>{
    case success(Value)
    case failure(Error)
}
