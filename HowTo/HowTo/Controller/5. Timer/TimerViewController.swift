//
//  TimeViewController.swift
//  HowTo
//
//  Created by Novi Gunawan on 04/05/21.
//

import UIKit
import AVFoundation
final class TimerViewController: UIViewController {
    //Label outlet
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    //Image outlet
    @IBOutlet weak var pourRiceImage: UIImageView!
    //Button outlet
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var tutorialIndexPath = 0
    var stepIndex = 0
    
    //Sound
    var ringingBellSound: AVAudioPlayer!
    lazy var pathRingingBellSound = Bundle.main.path(forResource: "ringingBell", ofType: "mp3")
    lazy var urlRingingBellSound = URL(fileURLWithPath: pathRingingBellSound!)
    
    //Waktu timer dalam detik = 8 menit * 60 detik
    var count = 0
    var timer = Timer()
    var timeIsCounting:Bool = false
    
    func secondsToMinutesSeconds(seconds: Int) -> (Int,Int) {
        return ((seconds / 60), ((seconds % 3600) % 60))
    }
    
    //Play and Stop Button
    lazy var playIcon = UIImage(systemName: "play.circle.fill", withConfiguration: largeConfig)
    lazy var stopIcon = UIImage(systemName: "stop.circle.fill", withConfiguration: largeConfig)
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 45, weight: .bold, scale: .large)
    
    lazy var tutorial = tutorials[tutorialIndexPath].steps[stepIndex]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Step index di Timer : \(stepIndex)")
        pourRiceImage.image = UIImage(named: tutorial.image)
        count = Int(tutorial.desc[0])!-5
        playButton.setImage(playIcon, for: .normal)
        nextButton.isHidden = true
    }
    @IBAction func playStopButtonPressed(_ sender: UIButton) {
      
        if(timeIsCounting) {
            timeIsCounting = false
            timer.invalidate()
            playButton.setImage(playIcon, for: .normal)
        }
        else {
            timeIsCounting = true
            playButton.setImage(stopIcon, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    //Function yang dilakukan ketika timer berjalan
    @objc func timerCounter() -> Void {
        if(count <= 0) {
            count = Int(tutorial.desc[0])!
        }
        count -= 1
        let time = secondsToMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        timerLabel.text = timeString
        
        if(count == 0){
            timer.invalidate()
            nextButton.isHidden = false
            playButton.setImage(playIcon, for: .normal)
            
            do {
                ringingBellSound = try AVAudioPlayer(contentsOf: urlRingingBellSound)
                ringingBellSound.volume = 0.5
                ringingBellSound.numberOfLoops = -1
                ringingBellSound.play()
            } catch {
                print(error)
            }
        }
    }
    
    func makeTimeString(minutes : Int, seconds : Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        
        return timeString
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        stepIndex = 4
        ringingBellSound.stop()
        let secondTimerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondTimerViewController") as SecondTimerViewController
        navigationController?.pushViewController(secondTimerVC, animated: true)
        secondTimerVC.tutorialIndexPath = tutorialIndexPath
        secondTimerVC.stepIndex = stepIndex
    }
    
}
