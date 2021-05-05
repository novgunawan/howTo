//
//  TutorialData.swift
//  HowTo
//
//  Created by Novi Gunawan on 29/04/21.
//

import Foundation

var tutorials = [
    Tutorials(id: 0, title: "Cook rice on your own", time: 20, image: "tutorialRice", steps: [
        
        Steps(id: 0, title: "Determine your rice", image: "tutorial-0", desc: [], supportingImages: []),
        
        Steps(id: 1, title: "Prepare these ingredients", image: "", desc: [
            "-  2 cup of water (470 ml)",
            "-  1.75 cup of water (411 ml)",
            "-  1.5 cup of water (353 ml)",
            "-  1.25 cup of water (294 ml)"],
              supportingImages: ["rice&water-0", "rice&water-1", "rice&water-2", "rice&water-3"]),
        
        Steps(id: 2, title: "Wash the rice twice with water", image: "tutorial-2", desc: [], supportingImages: []),
        
        Steps(id: 3, title: "Boil the water with rice Keep the lid off", image: "tutorial-3", desc: ["8"], supportingImages: []),
        
        Steps(id: 4, title: "Boil the water with rice Keep the lid on", image: "tutorial-4", desc: ["12"], supportingImages: [])
    ]
    
    )
]

var choices = [
    "long-grain white rice and wild rice.",
    "jasmine rice",
    "basmati rice",
    "short-grain white rice"]
