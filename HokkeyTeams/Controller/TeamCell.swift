//
//  TeamCell.swift
//  HokkeyTeams
//
//  Created by Bend3r on 12.04.2021.
//

import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLocation: UILabel!
    @IBOutlet weak var teamConference: UILabel!
    @IBOutlet weak var teamDivision: UILabel!
    
    func configure(with team: Team) {
        teamName.text = team.team.name ?? "Команда не найдено"
        teamLocation.text = team.team.location ?? "Локация не найдено"
        teamConference.text = team.team.conference ?? "Конференция не найдено"
        teamDivision.text = team.team.division ?? "Дивизион не найден"
        
        DispatchQueue.global().async {
            guard let image = team.team.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.teamImage.image = UIImage(data: imageData)
            }
        }
    }

}
