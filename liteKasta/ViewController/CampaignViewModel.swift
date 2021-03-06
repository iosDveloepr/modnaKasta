//
//  CampaignViewModel.swift
//  liteKasta
//
//  Created by Zoreslav Khimich on 4/3/18.
//  Copyright © 2018 Markason LLC. All rights reserved.
//

import IGListKit

extension ViewController {
    class Campaign: NSObject {
        let identifier: Int
        let title: String
        let desc: String
        let countdownToDate: Date
        let bannerPath: String
        let codename: String
        
        init(with aCampaign: KastaAPI.Campaign) {
            identifier = aCampaign.id
            title = aCampaign.name
            desc = aCampaign.description
            countdownToDate = aCampaign.finishesAt
            bannerPath = aCampaign.nowImage
            codename = aCampaign.codename
            super.init()
        }
    }
    
    class FutureCampaign: NSObject{
        private var identifier: String = UUID().uuidString
        var futureCampaign : [Campaign]
        
        init(futureCampaign: [Campaign]){
            self.futureCampaign = futureCampaign
        }
    }
}

extension ViewController.Campaign: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSNumber
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? ViewController.Campaign else {
            return false
        }
        return title == o.title && desc == o.desc && countdownToDate == o.countdownToDate && bannerPath == o.bannerPath
    }
}

extension ViewController.FutureCampaign: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ViewController.FutureCampaign else {
            return false
        }
        
        return self.identifier == object.identifier
    }
}


