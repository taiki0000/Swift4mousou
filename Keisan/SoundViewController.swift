//
//  SoundViewController.swift
//  Swift4Mousou
//
//  Created by taiki on 2018/10/28.
//  Copyright © 2018年 taiki. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isHidden = true
        
        timeLabel.isHidden = true
        // Do any additional setup after loading the view.
        //音声を再生する
        playSound(name: "callMusic")
    }
    
    @IBAction func deny(_ sender: UIButton) {
        
        audioPlayer.stop()
        //音声をストップする
        //電話を切る
        //画面をviewcontrollerに戻す
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tap(_ sender: UIButton) {
        
        //画面のイメージを変える
        imageView.isHidden = false
        
        //timelabelの非表示を変更
        timeLabel.isHidden = false
        
        //タイマーをスタートする
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(timecountUp), userInfo: nil, repeats: true)
        
        //音声をスタートする
        playSound(name: "baby")
        
    }
    
    @objc func timecountUp() {
        count = count + 1
        timeLabel.text = String(count)
    }
    
    func playSound(name: String){
        
        if let url = Bundle.main.url(forResource: name, withExtension:"mp3") {
            do {
                audioPlayer = try AVAudioPlayer (contentsOf: url)
                audioPlayer?.play()
            } catch{
                audioPlayer = nil
            }
        } else {
            fatalError("url is nil.")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
