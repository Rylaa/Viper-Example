//
//  AdvertisingTableViewCell.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import UIKit

final class BannerCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(text: String) {
        title.text = text
    }

}

extension BannerCell {
    static var nib: UINib = {
        return UINib(nibName: identifier, bundle: nil)
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
}
