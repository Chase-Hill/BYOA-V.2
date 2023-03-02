//
//  UserViewController.swift
//  BYOA-V.2
//
//  Created by Chase on 3/1/23.
//

import UIKit

protocol SearchTermDelegate: AnyObject {
    func didSelect(searchTerm: String)
}

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
        print("\(#file)\(#line)")
        
        searchBar.delegate = self
    }
    
    // MARK: - Properties
    var userDetails: UserDetails? {
        didSet {
            guard let userDetails = userDetails else { return }
            updateViews(forUser: userDetails)
        }
    }
    
    weak var searchTermDelegate: SearchTermDelegate?
    
    // MARK: - Functions
    private func presentNoUserFoundAlertController(messageText: String) {
        let alertController = UIAlertController(title: "No User Found", message: messageText, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Okay", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
    func updateViews(forUser user: UserDetails) {
        self.nameLabel.text = "Player Name: \(user.name ?? "No Name Availablee")"
        self.followerLabel.text = "Player Follower Count: \(user.followers)"
        self.locationLabel.text = "Player Location: \(user.location ?? "User Is Not Displaying Location")"
        self.leagueLabel.text = "Player Current League: \(user.league)"
        fetchUserImage(forUser: user)
    }
    
    func fetchUserImage(forUser user: UserDetails) {
        ChessService.fetchUserImage(forUser: user.avatar ?? "") { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.userAvatarImage.image = image
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.userAvatarImage.image = nil
                }
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}

extension UserViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        ChessService.fetchChessUser(searchTerm: searchTerm) { [weak self] result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.userDetails = user
                    self?.updateViews(forUser: user)
                }
            case .failure( let error):
                DispatchQueue.main.async {
                    self?.presentNoUserFoundAlertController(messageText: error.errorDescription!)
                }
                print(error.errorDescription ?? Constants.Error.unknownError)
            }
        }
    }
}
