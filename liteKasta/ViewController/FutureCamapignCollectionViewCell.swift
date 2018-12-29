//
//  FutureCamapignCollectionViewCell.swift
//  liteKasta
//
//  Created by Yermakov Anton on 12/28/18.
//  Copyright © 2018 Markason LLC. All rights reserved.
//

import UIKit

extension ViewController {
 class FutureCamapignCell: UICollectionViewCell {
    
    let title = UILabel()
    let buttonAllActions = UIButton()
    
    let actionOne = UILabel()
    let descOne = UILabel()
    let actionTwo = UILabel()
    let descTwo = UILabel()
    let actionThree = UILabel()
    let descThree = UILabel()
    
    
    func futureCamapignBanner(futureCamapignData: ViewController.FutureCampaign){
        actionOne.text = futureCamapignData.futureCampaign[0].title
        descOne.text = futureCamapignData.futureCampaign[0].desc
        actionTwo.text = futureCamapignData.futureCampaign[1].title
        descTwo.text = futureCamapignData.futureCampaign[1].desc
        actionThree.text = futureCamapignData.futureCampaign[2].title
        descThree.text = futureCamapignData.futureCampaign[2].desc
    }
   
  
    let cornersOverlay = UIImageView(image: UIImage(named: "CampaignCell/4ptClipCorners"))
    
    static let captionBlockHeight: CGFloat = 76
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .campaignCellBackground
        isOpaque = true
        
        title.text = "СКОРО В ПРОДАЖЕ"
        title.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        title.textColor = .grayText
        addSubview(title)
        
        actionOne.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        actionOne.textColor = .normalText
        addSubview(actionOne)
        actionTwo.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        actionTwo.textColor = .normalText
        addSubview(actionTwo)
        actionThree.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        actionThree.textColor = .normalText
        addSubview(actionThree)
        
        descOne.font =  UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        descOne.textColor = .grayText
        addSubview(descOne)
        descTwo.font =  UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        descTwo.textColor = .grayText
        addSubview(descTwo)
        descThree.font =  UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        descThree.textColor = .grayText
        addSubview(descThree)
        
        buttonAllActions.setTitle("Все предстоящие акции", for: .normal)
        buttonAllActions.setTitleColor(.greenText, for: .normal)
        buttonAllActions.contentHorizontalAlignment = .left
        buttonAllActions.addTarget(self, action: #selector(openAllActions), for: .touchUpInside)
        addSubview(buttonAllActions)
       
        addSubview(cornersOverlay)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    override func prepareForReuse() {
        title.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        title.frame = CGRect(x: 16, y:  16, width: bounds.width - 32, height: 24)
        cornersOverlay.frame = bounds
        
        actionOne.frame = CGRect(x: 16, y:  title.frame.maxY + 20, width: bounds.width - 32, height: 24)
        descOne.frame = CGRect(x: 16, y:  actionOne.frame.maxY + 4, width: bounds.width - 32, height: 16)
        
        actionTwo.frame = CGRect(x: 16, y:  descOne.frame.maxY + 20, width: bounds.width - 32, height: 24)
        descTwo.frame = CGRect(x: 16, y:  actionTwo.frame.maxY + 4, width: bounds.width - 32, height: 16)
        
        actionThree.frame = CGRect(x: 16, y:  descTwo.frame.maxY + 20, width: bounds.width - 32, height: 24)
        descThree.frame = CGRect(x: 16, y:  actionThree.frame.maxY + 4, width: bounds.width - 32, height: 16)
        
        buttonAllActions.frame = CGRect(x: 16, y: descThree.frame.maxY + 20, width: bounds.width - 32, height: 18)
        
    }
  }
    
    // Link don't work
    @objc private func openAllActions(){
        if let webURL = URL(string: "https://modnakasta.ua/#soon") {
            UIApplication.shared.openURL(webURL)
        }
    }
    
}
