//
//  UserViewController.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    // MARK: - Properties
    var userDetails: UserDetails? {
        didSet {
            guard let userDetails = userDetails else { return }
            updateViews(forUser: userDetails)
        }
    }
    
    // MARK: - Functions
    func updateViews(forUser user: UserDetails) {
        ChessService.fetchUserImage(forUser: user.avatar ?? "") { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.userAvatarImage.image = image
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.userAvatarImage.image = nil
                }
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
        ChessService.fetchChessUser(searchTerm: user.username) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.nameLabel.text = "Player Name: \(user.name ?? "No Name Availablee")"
                    self.followerLabel.text = "Player Follower Count: \(user.followers)"
                    self.locationLabel.text = "Player Location: \(user.location ?? "User Is Not Displaying Location")"
                    self.leagueLabel.text = "Player Current League: \(user.league)"
                }
            case .failure(let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}

extension UserViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        ChessService.fetchChessUser(searchTerm: searchTerm) { user in
            switch user {
            case .success(let user):
                DispatchQueue.main.async {
                    self.userDetails = user
                    self.updateViews(forUser: user)
                }
            case .failure( let error):
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
