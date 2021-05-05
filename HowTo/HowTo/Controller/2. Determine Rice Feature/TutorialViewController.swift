//
//  TutorialViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 30/04/21.
//

import UIKit

class TutorialViewController: UIViewController {
    @IBOutlet weak var riceImage: UIImageView!
    //Outlets for button
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    var tutorialIndexPath = 0
    var stepIndex = 0
    lazy var tutorial = tutorials[tutorialIndexPath].steps[stepIndex]
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //setting navigation bar
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //navigation bar jadi transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
  
        riceImage.image = UIImage(named: tutorial.image)
        //Button set Title
        firstButton.setTitle(choices[0], for: .normal)
        secondButton.setTitle(choices[1], for: .normal)
        thirdButton.setTitle(choices[2], for: .normal)
        fourthButton.setTitle(choices[3], for: .normal)
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton!) {
       stepIndex = 1
        print("Step index : \(stepIndex)")

        let tutorialPrepareVC = TutorialPrepareVC(nibName: "TutorialPrepareVC", bundle: nil)
        navigationController?.pushViewController(tutorialPrepareVC, animated: true)
        //Passing data
        tutorialPrepareVC.tutorialIndexPath = tutorialIndexPath
        tutorialPrepareVC.stepIndex = stepIndex
        tutorialPrepareVC.choiceIndex = sender.tag
    }
}
