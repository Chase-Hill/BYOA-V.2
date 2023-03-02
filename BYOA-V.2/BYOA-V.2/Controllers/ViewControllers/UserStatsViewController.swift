//
//  UserStatsViewController.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import UIKit

class UserStatsViewController: UIViewController, SearchTermDelegate {
    
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
        print("\(#file)\(#line)")
        super.viewDidLoad()
    }
    
    // MARK: - Properties
    var userStats: UserStats? {
        didSet {
            fetchUserStats()
        }
    }
    
    
    // MARK: - Functions
    func didSelect(searchTerm: String) {
        ChessService.fetchUserStats(searchTerm: searchTerm) { [weak self] result in
            switch result {
            case .success(let userStats):
                DispatchQueue.main.async {
                    self?.updateViews(forUser: userStats)
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
    
    func updateViews(forUser user: UserStats) {
        ChessService.fetchUserStats(searchTerm: "") { result in
            switch result {
            case .success(let userStats):
                DispatchQueue.main.async {
                    self.dailyRatingLabel.text = String(userStats.daily.best.rating)
                    self.dailyWinLabel.text = "Wins: \(userStats.daily.record.win)"
                    self.dailyLossLabel.text = "Losses: \(userStats.daily.record.loss)"
                    self.dailyDrawLabel.text = "Draws: \(userStats.daily.record.draw)"
                    
                    self.rapidRatingLabel.text = String(userStats.rapid.best.rating)
                    self.rapidWinLabel.text = "Wins: \(userStats.rapid.record.win)"
                    self.rapidLossLabel.text = "Losses: \(userStats.rapid.record.loss)"
                    self.rapidDrawLabel.text = "Draws: \(userStats.rapid.record.draw)"
                    
                    self.blitzRatingLabel.text = String(userStats.blitz.best.rating)
                    self.blitzWinLabel.text = "Wins: \(userStats.blitz.record.win)"
                    self.blitzLossLabel.text = "Losses: \(userStats.blitz.record.loss)"
                    self.blitzDrawLabel.text = "Draws: \(userStats.blitz.record.draw)"
                    
                    self.bulletRatingLabel.text = String(userStats.bullet.best.rating)
                    self.bulletWinLabel.text = "Wins: \(userStats.bullet.record.win)"
                    self.bulletLossLabel.text = "Losses: \(userStats.bullet.record.loss)"
                    self.bulletDrawLabel.text = "Draws: \(userStats.bullet.record.draw)"
                    
                    self.tacticsRecordRatingLabel.text = "Highest Puzzle Rating: \(userStats.tactics.highest.rating)"
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
    
    func fetchUserStats() {
        ChessService.fetchUserStats(searchTerm: "") { [weak self] result in
            switch result {
            case .success(let userStats):
                DispatchQueue.main.async {
                    self?.updateViews(forUser: userStats)
                    
                    self?.dailyRatingLabel.text = "Rating: \(userStats.daily.best.rating)"
                    self?.dailyWinLabel.text = "Wins: \(userStats.daily.record.win)"
                    self?.dailyLossLabel.text = "Losses: \(userStats.daily.record.loss)"
                    self?.dailyDrawLabel.text = "Draws: \(userStats.daily.record.draw)"
                    
                    self?.rapidRatingLabel.text = String(userStats.rapid.best.rating)
                    self?.rapidWinLabel.text = "Wins: \(userStats.rapid.record.win)"
                    self?.rapidLossLabel.text = "Losses: \(userStats.rapid.record.loss)"
                    self?.rapidDrawLabel.text = "Draws: \(userStats.rapid.record.draw)"
                    
                    self?.blitzRatingLabel.text = String(userStats.blitz.best.rating)
                    self?.blitzWinLabel.text = "Wins: \(userStats.blitz.record.win)"
                    self?.blitzLossLabel.text = "Losses: \(userStats.blitz.record.loss)"
                    self?.blitzDrawLabel.text = "Draws: \(userStats.blitz.record.draw)"
                    
                    self?.bulletRatingLabel.text = String(userStats.bullet.best.rating)
                    self?.bulletWinLabel.text = "Wins: \(userStats.bullet.record.win)"
                    self?.bulletLossLabel.text = "Losses: \(userStats.bullet.record.loss)"
                    self?.bulletDrawLabel.text = "Draws: \(userStats.bullet.record.draw)"
                    
                    self?.tacticsRecordRatingLabel.text = "Highest Puzzle Rating: \(userStats.tactics.highest.rating)"
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
