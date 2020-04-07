//
//  HurtsTableViewController.swift
//  hurtsMusicPlayer
//
//  Created by 蕭聿莘 on 2020/3/31.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit
import AVFoundation

class HurtsTableViewController: UITableViewController {
    var player = AVAudioPlayer()
    //歌名需跟內建檔案檔名一致
    var songs = [Song(title: "Blood,Tears & Gold", album: "Happiness"),
                 Song(title: "Wonderful Life", album: "Happiness"),
                 Song(title: "Unspoken", album: "Happiness"),
                 Song(title: "Silver Lining", album: "Happiness"),
                 Song(title: "Miracle", album: "Exile(Deluxe)"),
                 Song(title: "Sandman", album: "Exile(Deluxe)")]
    
    let imageOriganlHeight: CGFloat =  350//預留圖片高度
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //contentInsert指的是scrollView的contentView頂點相對於frame頂點的偏移量，這裡把設定好的imageOrignalHeight帶入top，讓表格預留空間
        tableView.contentInset = UIEdgeInsets(top: imageOriganlHeight, left: 0, bottom: 0, right:  0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    //cell的style設為custom寫法
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! HurtsTableViewCell
        let hurtsSong = songs[indexPath.row]
        cell.titleLabel.text = hurtsSong.title
        cell.subTitleLabel.text = hurtsSong.album
        // Configure the cell...
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let hurtsSong = songs[indexPath.row]
            let playerPath = Bundle.main.path(forResource: hurtsSong.title , ofType: ".mp3")
            let controller = parent as? MainViewController
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: playerPath!) as URL)
            player.play()
            controller?.playButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)

            controller?.nowPlayingLabel.isHidden = false
            controller?.nowPlayingLabel.text = hurtsSong.title
        } catch {
            print("Error")
        }
    }
    
    //表格捲動時觸發
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //用parent property讀取容納SongTableViewController的MainViewController物件
        let controller = parent as? MainViewController
        //ㄧ開始的orignalOffsetY = -350
        let orignalOffsetY = -imageOriganlHeight
        //abs為取絕對值方法，讓捲動大小保持正數
        let moveDistance = abs(scrollView.contentOffset.y - orignalOffsetY)
    //如果表格高度小於圖片高度，讓圖片隨著捲動距離變高;大於的話，將表格的背景顏色隨著捲動距離逐漸變暗
        if scrollView.contentOffset.y < orignalOffsetY {
            controller?.imageHeightConstraint.constant = imageOriganlHeight + moveDistance
            tableView.backgroundColor = UIColor.clear
        }else{
            controller?.imageHeightConstraint.constant = imageOriganlHeight
            tableView.backgroundColor = UIColor(white: 0, alpha: moveDistance/imageOriganlHeight)
        }
    }
}
