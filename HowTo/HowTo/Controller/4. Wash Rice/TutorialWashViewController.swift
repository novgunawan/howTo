//
//  TutorialWashViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 04/05/21.
//

import UIKit

class TutorialWashViewController: UIViewController {
    
    var tutorialIndexPath = 0
    var stepIndex = 0
    //Label outlet
    @IBOutlet weak var instructionLabel: UILabel!
    
    //Button outlet
    @IBOutlet weak var nextButton: UIButton!
    
    //Image outlet
    @IBOutlet weak var washImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Stepindex di washing rice : \(stepIndex)")
        washImage.image = UIImage(named:tutorials[tutorialIndexPath].steps[stepIndex].image)
        let tutorialLabel = tutorials[tutorialIndexPath].steps[stepIndex].title
        instructionLabel.text = tutorialLabel
        nextButton.backgroundColor = #colorLiteral(red: 0.9940029979, green: 0.8215696216, blue: 0.4002096653, alpha: 1)
    }
    @IBAction func nextButtonPressed(_ sender: UIButton!) {
        stepIndex = 3
        let timerVC = TimerViewController(nibName: "TimeViewController", bundle: nil)
        navigationController?.pushViewController(timerVC, animated: true)
        timerVC.tutorialIndexPath = tutorialIndexPath
        timerVC.stepIndex = stepIndex
        
        
    }
}
