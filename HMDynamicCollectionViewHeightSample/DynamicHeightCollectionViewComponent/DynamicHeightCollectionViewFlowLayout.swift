//
//  DynamicHeightCollectionViewFlowLayout.swift
//  HMDynamicCollectionViewHeightSample
//
//  Created by 정하민 on 2021/08/08.
//

import UIKit

class DynamicHeightCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // super를 호출하여 layoutAttributes의 값을 획득합니다.
        let layoutAttributeObjects = super.layoutAttributesForElements(in: rect)
        
        layoutAttributeObjects?.forEach { layoutAttributes in
            // cell의 layoutAttributes만 조정하기 위해 representedElementCategory Property를 이용해 cell인지 체크합니다.
            if layoutAttributes.representedElementCategory == .cell {
                // cell인 경우, 그 아이템의 indexPath를 이용해 layoutAttributesForItem을 호출하고 각 cell 마다의 SelfSizing된 frame을 획득합니다.
                if let newFrame = layoutAttributesForItem(at: layoutAttributes.indexPath)?.frame {
                    layoutAttributes.frame = newFrame
                }
            }
        }
        
        return layoutAttributeObjects
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        // indexPath를 통해 해당 cell의 layoutAttributes를 얻어옵니다.
        guard let layoutAttirbutes = super.layoutAttributesForItem(at: indexPath) else { return nil }
        
        // collectionView 절반을 차지하도록 width를 계산합니다.
        layoutAttirbutes.frame.size.width = (collectionView.safeAreaLayoutGuide.layoutFrame.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing) / 2
        
        return layoutAttirbutes
    }
}
