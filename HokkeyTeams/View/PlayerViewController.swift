//
//  PlayerViewController.swift
//  HokkeyTeams
//
//  Created by Bend3r on 12.04.2021.
//

import UIKit

class PlayerViewController: UITableViewController {
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/players_v2_light.json"
    private var players: [Player] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlayerData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell {
            let player = players[indexPath.row]
            cell.configure(with: player)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - Fetch data
    private func fetchPlayerData() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.players = try JSONDecoder().decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Error ", error)
            }
        }.resume()
    }
}
