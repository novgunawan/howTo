//
//  ViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 29/04/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "tutorialCell", for: indexPath) as? TutorialCell)!
        
        cell.fgColor.layer.cornerRadius = 10
        cell.fgColor.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        cell.tutorialImage.image = UIImage(named: tutorials[indexPath.row].image)
        cell.tutorialLabel.text = tutorials[indexPath.row].title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //hide navigation bar di home-page, dan munculin navigation bar di VC lain
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    }
}

