//
//  Tutorial.swift
//  HowTo
//
//  Created by Novi Gunawan on 29/04/21.
//

import Foundation

struct Tutorials {
    let id: Int
    let title: String
    let time: Int
    //untuk image dalam tutorial detail
    let image: String
    let steps: [Steps]
}

struct Steps {
    let id: Int
    let title: String
    let image: String
    let desc: [String]
    let supportingImages: [String]
}

