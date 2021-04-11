//
//  PlayerCell.swift
//  HokkeyTeams
//
//  Created by Bend3r on 12.04.2021.
//

import UIKit

class PlayerCell: UITableViewCell {
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerTeam: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    
    func configure(with player: Player) {
        playerTeam.text = player.team.name ?? "Команда не найдено"
        playerName.text = player.name ?? "Имя не найдено"
        playerNumber.text = "N\(player.shirt_number ?? 0)"
        
        DispatchQueue.global().async {
            guard let image = player.image else { return}
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.playerImage.image = UIImage(data: imageData)
            }
        }
    }
}
