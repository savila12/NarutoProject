//
//  CustomCollectionView.swift
//  NarutoProject
//
//  Created by Matthew Hernandez on 7/31/21.
//

import Foundation
import UIKit

class CustomCollectionView: UICollectionViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var episodesLabel: UILabel!
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    var animeObject: Anime? {
        willSet(value){
            guard let value = value else {return}
            self.titleLabel.text = "Title: \(value.title ?? "-")"
            self.typeLabel.text = "Type: \(value.type ?? "-")"
            self.episodesLabel.text = "Episodes: \(value.episodes ?? 0)"
            self.releaseLabel.text = "Release Date: \(value.start_date ?? "-")"
            let image = value.image_url
            
            /// Using third party to cache image
            imgView.sd_setImage(with: URL(string: "\(image ?? "")"), completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
