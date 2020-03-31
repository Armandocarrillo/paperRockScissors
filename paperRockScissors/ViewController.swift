//
//  ViewController.swift
//  paperRockScissors
//
//  Created by Armando Carrillo on 31/03/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var computerEmoji: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var rockPlayer: UIButton!
    @IBOutlet var paperPlayer: UIButton!
    @IBOutlet var scissorsPlayer: UIButton!
    @IBOutlet var playAgain: UIButton!
    
    
    
    func play(_ playerTurn: Sign){
        rockPlayer.isEnabled = false
        paperPlayer.isEnabled = false
        scissorsPlayer.isEnabled = false
        
        let opponent = randomSign()
        computerEmoji.text = opponent.emoji
        let gameResult = playerTurn.takeTurn(opponent)
            switch gameResult {
            case .draw:
                stateLabel.text = "Es un empate"
                view.backgroundColor = UIColor.yellow
            case .win:
                stateLabel.text = "Tu ganas"
                view.backgroundColor = UIColor.green
            case .lose:
                stateLabel.text = "Tu pierdes"
                view.backgroundColor = UIColor.red
            case .start:
                stateLabel.text = "Piedra, Papel o Tijera"
                
            }
            switch playerTurn{
            case .rock:
                rockPlayer.isHidden = false
                paperPlayer.isHidden = true
                scissorsPlayer.isHidden = true
            case .paper:
                rockPlayer.isHidden = true
                paperPlayer.isHidden = false
                scissorsPlayer.isHidden = true
            case .scissors:
                rockPlayer.isHidden = true
                paperPlayer.isHidden = true
                scissorsPlayer.isHidden = false
            }
        playAgain.isHidden = false
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   resetEmoji()
    }
    func resetEmoji() {
        computerEmoji.text = "🤖"
        stateLabel.text = " piedra, papel o tijera"
        rockPlayer.isHidden = false
        rockPlayer.isEnabled = true
        paperPlayer.isHidden = false
        paperPlayer.isEnabled = true
        scissorsPlayer.isHidden = false
        scissorsPlayer.isEnabled = true
        playAgain.isHidden = true
        view.backgroundColor = UIColor.gray
    }
    
    @IBAction func rockAction(_ sender: UIButton) {
        play(Sign.rock)
    }
    
    @IBAction func paperAction(_ sender: UIButton) {
        play(Sign.paper)
    }
    @IBAction func scissorsAction(_ sender: UIButton) {
        play(Sign.scissors)
    }
    
    @IBAction func playAgainAction(_ sender: UIButton) {
        resetEmoji()
    }
    

}

