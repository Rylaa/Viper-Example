//
//  StoriesTableViewCell.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var data: [MeditationAndStoryResultable] = []
    
    var selectedItem: ((_ model: MeditationAndStoryResultable) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.collectionViewLayout = setCollectionViewLayout()

        
    }
    
    fileprivate func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let userInterface = UIDevice.current.userInterfaceIdiom
        if userInterface == .phone {
            let bounds = UIScreen.main.bounds
            if bounds.height > bounds.width {
                layout.itemSize = CGSize(width: phoneWidth(), height: phoneHeight())
            } else {
                layout.itemSize = CGSize(width: phoneWidthWide(), height: phoneHeightWide())
            }
            layout.minimumLineSpacing = 0
        } else {
            layout.itemSize = CGSize(width: 169, height: 258)

        }
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        return layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config(_ data: [MeditationAndStoryResultable]) {
        self.data = data
        collectionView.reloadData()
    }
    
}

extension StoriesTableViewCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}


extension StoriesTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as! StoryCollectionViewCell
        let model = data[indexPath.row]
        cell.config(model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = data[indexPath.row]
        selectedItem?(model)
    }
}

extension StoriesTableViewCell {
    private func phoneHeightWide() -> CGFloat {
        let width: CGFloat = 156
        let calculatedWidth = phoneWidthWide()
        let ratio = calculatedWidth / width
        let lastHeight: CGFloat = (209 * ratio) + 32
        return lastHeight
    }
    
    private func phoneWidthWide() -> CGFloat {
        let width: CGFloat = (UIScreen.main.bounds.width - 160 ) / 4
       return width
    }
    
    private func phoneHeight() -> CGFloat {
        let width: CGFloat = 156
        let calculatedWidth = (UIScreen.main.bounds.width / 2) - 42
        let ratio = calculatedWidth / width
        let lastHeight: CGFloat = (209 * ratio) + 32
        return lastHeight
    }
    
    private func phoneWidth() -> CGFloat {
        let width: CGFloat = (UIScreen.main.bounds.width / 2) - 42
       return width
    }
}
