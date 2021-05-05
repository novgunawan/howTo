//
//  CongratulationsViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 04/05/21.
//

import UIKit

class CongratulationsViewController: UIViewController {
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var riceImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        riceImage.image = UIImage(named: "rice")
        //Set timer 3 detik ketika modal selesai ditampilkan dan kembali ke home page
        var timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToHome), userInfo: nil, repeats: false)
    }
    
    @objc func moveToHome() {
        self.performSegue(withIdentifier: "unwindToMenuSegue", sender: self)
//        self.view.window!.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
//        let homePageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as ViewController
//        navigationController?.pushViewController(homePageVC, animated: true)
    }

}
