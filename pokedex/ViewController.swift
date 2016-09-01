//
//  ViewController.swift
//  pokedex
//
//  Created by Hadi Roohian on 31/08/2016.
//  Copyright © 2016 HadsDevs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection : UICollectionView!
    var pokemon = [Pokemon]()
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        initAudio()
        parsCSV()
        
    }
    
    func initAudio(){
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func parsCSV() {
        
        let csvFile = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: csvFile!)
            let rows = csv.rows
            
            for row in rows {
                
                let name = row["identifier"]!
                let pokeId = Int(row["id"]!)!
                
                let poke = Pokemon(name: name.capitalizedString, pokedexId: pokeId)
                pokemon.append(poke)
                
                
                
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            let pokee = self.pokemon[indexPath.row]
            
            cell.configureCell(pokee)
            
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pokemon.count
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row + 1)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSizeMake(110.0, 110.0)
        return size
    }

    
    @IBAction func onMusicBtnTapped(sender : UIButton!){
        
        if audioPlayer.playing {
            audioPlayer.stop()
            sender.alpha = 0.7
        } else {
            audioPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    func stopOrPlay(){
        
        
        
    }
    
    
}

