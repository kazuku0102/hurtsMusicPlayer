//
//  MainViewController.swift
//  hurtsMusicPlayer
//
//  Created by 蕭聿莘 on 2020/3/31.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    var playItem: AVPlayerItem?
    
    //從圖片高度的constraint拉outlet
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var reapeatButton: UIButton!
    

    @IBAction func play(_ sender: UIButton) {
        let tableController = children.first as? HurtsTableViewController
                      if tableController?.player.isPlaying == true{
                          tableController?.player.pause()
                          playButton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
                      }else{
                          tableController?.player.play()
                          playButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
                      }
          }
          
          
          @IBAction func replay(_ sender: UIButton) {
            let tableController = children.first as? HurtsTableViewController
            if tableController?.player.isPlaying == true {
                tableController?.player.currentTime = 0
                tableController?.player.play()
             playButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
            }else{
                tableController?.player.play()
                playButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
            }
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nowPlayingLabel.isHidden = true
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
