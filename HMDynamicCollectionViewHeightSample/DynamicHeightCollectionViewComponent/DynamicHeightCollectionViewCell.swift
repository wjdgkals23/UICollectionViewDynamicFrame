//
//  DynamicHeightCollectionViewCell.swift
//  HMDynamicCollectionViewHeightSample
//
//  Created by 정하민 on 2021/08/08.
//

import UIKit
import SnapKit

class DynamicHeightCollectionViewCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabelText(text: String) {
        label.text = text
    }
}
