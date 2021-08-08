//
//  ViewController.swift
//  HMDynamicCollectionViewHeightSample
//
//  Created by 정하민 on 2021/08/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let dataSource: [String] = ["Text","Text Text Text", "Text Text Text", "Text"]
    
    let collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: DynamicHeightCollectionViewFlowLayout())
        collectionView.register(DynamicHeightCollectionViewCell.self, forCellWithReuseIdentifier: DynamicHeightCollectionViewCell.description())
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(collectionView)
          
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DynamicHeightCollectionViewCell.description(), for: indexPath) as! DynamicHeightCollectionViewCell
        
        cell.configureLabelText(text: dataSource[indexPath.row])
        
        return cell
    }
}

