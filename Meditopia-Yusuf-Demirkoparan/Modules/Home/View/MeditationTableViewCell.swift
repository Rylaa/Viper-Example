//
//  MeditationTableViewCell.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import UIKit

final class MeditationTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: [MeditationAndStoryResultable] = []
    
    var selectedItem: ((_ model: MeditationAndStoryResultable) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func config(_ data: [MeditationAndStoryResultable]) {
        self.data = data
        collectionView.reloadData()
    }
}

extension MeditationTableViewCell {
    static var nib: UINib = {
       return UINib(nibName: identifier, bundle: nil)
    }()
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension MeditationTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionViewCell.identifier, for: indexPath) as! MeditationCollectionViewCell
        let model = data[indexPath.row]
        cell.config(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = data[indexPath.row]
        selectedItem?(model)
    }
}
