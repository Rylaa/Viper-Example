//
//  MeditationCollectionViewCell.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//


import UIKit
import SDWebImage

final class MeditationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
    }
    
    func config(_ model: MeditationAndStoryResultable) {
        self.title.text = model.uiTitle
        self.subTitle.text = model.uiSubTitle
        self.imageView.sd_setImage(with: model.url, completed: nil)
    }
}

extension MeditationCollectionViewCell {
    static var nib: UINib = {
        return UINib(nibName: identifier, bundle: nil)
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
}
