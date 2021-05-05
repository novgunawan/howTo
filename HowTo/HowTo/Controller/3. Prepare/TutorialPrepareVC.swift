//
//  TutorialPrepareViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 03/05/21.
//

import UIKit

class TutorialPrepareVC: UIViewController {
    //Label outlet
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var waterNeededLabel: UILabel!
    @IBOutlet weak var riceNeededLabel: UILabel!
    @IBOutlet weak var potNeededLabel: UILabel!
    //Image outlet
    @IBOutlet weak var ricewaterImage: UIImageView!
    //Button outlet
    @IBOutlet weak var nextButton: UIButton!
    
    var tutorialIndexPath = 0
    var stepIndex = 0
    var choiceIndex = 0
    var text:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tutorial = tutorials[tutorialIndexPath].steps[stepIndex]
        print("Index yang didapat dari Tutorial View Controller : \(choiceIndex)")
        ricewaterImage.image = UIImage(named: tutorial.supportingImages[choiceIndex])
        waterNeededLabel.text = tutorial.desc[choiceIndex]
        print("Step index setelah ada di xib : \(stepIndex)")
    }
    
    @IBAction func startCookingButtonPressed(_ sender: UIButton) {
        stepIndex = 2
        let washVC = TutorialWashViewController(nibName: "TutorialWashViewController", bundle: nil)
        navigationController?.pushViewController(washVC, animated: true)
        //Passing data
        washVC.tutorialIndexPath = tutorialIndexPath
        washVC.stepIndex = stepIndex
    }
    

}
