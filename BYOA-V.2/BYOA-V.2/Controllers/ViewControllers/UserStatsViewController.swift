//
//  UserStatsViewController.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import UIKit

class UserStatsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var playerUsernameLabel: UILabel!
    
    @IBOutlet weak var dailyRatingLabel: UILabel!
    @IBOutlet weak var dailyWinLabel: UILabel!
    @IBOutlet weak var dailyLossLabel: UILabel!
    @IBOutlet weak var dailyDrawLabel: UILabel!
    
    @IBOutlet weak var rapidRatingLabel: UILabel!
    @IBOutlet weak var rapidWinLabel: UILabel!
    @IBOutlet weak var rapidLossLabel: UILabel!
    @IBOutlet weak var rapidDrawLabel: UILabel!
    
    @IBOutlet weak var blitzRatingLabel: UILabel!
    @IBOutlet weak var blitzWinLabel: UILabel!
    @IBOutlet weak var blitzLossLabel: UILabel!
    @IBOutlet weak var blitzDrawLabel: UILabel!
    
    @IBOutlet weak var bulletRatingLabel: UILabel!
    @IBOutlet weak var bulletWinLabel: UILabel!
    @IBOutlet weak var bulletLossLabel: UILabel!
    @IBOutlet weak var bulletDrawLabel: UILabel!
    
    @IBOutlet weak var tacticsRecordRatingLabel: UILabel!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Properties
    var userStats: UserStats?
    var searchTerm: String?
    var userName: UserDetails?
    
    // MARK: - Functions
    func updateViews(forUser user: UserStats) {
        ChessService.fetchUserStats(searchTerm: "") { result in
            switch result {
            case .success(let userStats):
                DispatchQueue.main.async { [self] in
                    self.playerUsernameLabel.text = 
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
