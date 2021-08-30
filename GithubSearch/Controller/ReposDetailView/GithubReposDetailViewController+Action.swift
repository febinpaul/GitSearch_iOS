//
//  GithubReposDetailViewController+Action.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import Foundation
import UIKit
import PINRemoteImage

extension GithubReposDetailViewController {
    
    func initilizeAction() {
        self.configureUI()
        self.populateData()
    }
    
    func configureUI() {
        view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.scrollViewContainer)
        self.scrollViewContainer.addArrangedSubview(self.mainInfoView)
        self.scrollViewContainer.addArrangedSubview(self.detailInfoView)
        self.scrollViewContainer.addArrangedSubview(self.likeDislikeView)
        
        let scrollViewDict: [String: Any] = ["scrollView": self.scrollView, "superview": self.view!]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollView]-|", options: [], metrics: nil, views: scrollViewDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[scrollView]-|", options: [], metrics: nil, views: scrollViewDict))
        
        let scrollViewContainerDict: [String: Any] = ["scrollViewContainer": self.scrollViewContainer, "scrollView": self.scrollView]
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[scrollViewContainer]-0-|", options: [], metrics: nil, views: scrollViewContainerDict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[scrollViewContainer(==scrollView)]-0-|", options: [], metrics: nil, views: scrollViewContainerDict))
        
        // MainInfoView
        self.mainInfoView.addSubview(self.stackViewMainViewContainer)
        self.stackViewMainViewContainer.addArrangedSubview(self.imageViewOwnerAvatar)
        self.stackViewMainViewContainer.addArrangedSubview(self.labelReposName)
        self.stackViewMainViewContainer.addArrangedSubview(self.labelLanguage)
        self.stackViewMainViewContainer.addArrangedSubview(self.viewStarContainer)
        self.viewStarContainer.addSubview(self.labelNumberOfStar)
        self.viewStarContainer.addSubview(self.imageViewStar)
        
        let stackViewMainViewContainerDict: [String: Any] = ["stackViewMainViewContainer": self.stackViewMainViewContainer]
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[stackViewMainViewContainer]-10-|", options: [], metrics: nil, views: stackViewMainViewContainerDict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[stackViewMainViewContainer]-0-|", options: [], metrics: nil, views: stackViewMainViewContainerDict))
        
        let viewStarContainerDict: [String: Any] = ["labelNumberOfStar": self.labelNumberOfStar, "imageViewStar": self.imageViewStar]
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageViewStar]-0-|", options: [], metrics: nil, views: viewStarContainerDict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[labelNumberOfStar]-5-[imageViewStar]-0-|", options: [], metrics: nil, views: viewStarContainerDict))
        NSLayoutConstraint(item: self.labelNumberOfStar, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.imageViewStar, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        // DetailInfoView
        self.detailInfoView.addSubview(self.stackViewDetailInfoViewContainer)
        self.stackViewDetailInfoViewContainer.addArrangedSubview(self.labelOwnersLoginName)
        self.stackViewDetailInfoViewContainer.addArrangedSubview(self.labelReposCreationDate)
        
        let stackViewdetailInfoViewContainerDict: [String: Any] = ["stackViewDetailInfoViewContainer": self.stackViewDetailInfoViewContainer]
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[stackViewDetailInfoViewContainer]-10-|", options: [], metrics: nil, views: stackViewdetailInfoViewContainerDict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[stackViewDetailInfoViewContainer]-10-|", options: [], metrics: nil, views: stackViewdetailInfoViewContainerDict))
        
        // LikeDislikeView
        self.likeDislikeView.addSubview(self.stackViewLikeDislikeViewContainer)
        self.stackViewLikeDislikeViewContainer.addArrangedSubview(self.buttonLikeButton)
        self.stackViewLikeDislikeViewContainer.addArrangedSubview(self.buttonDislikeButton)
        
        let stackViewLikeDislikeViewContainerDict: [String: Any] = ["stackViewLikeDislikeViewContainer": self.stackViewLikeDislikeViewContainer]
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[stackViewLikeDislikeViewContainer]-10-|", options: [], metrics: nil, views: stackViewLikeDislikeViewContainerDict))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[stackViewLikeDislikeViewContainer]-10-|", options: [], metrics: nil, views: stackViewLikeDislikeViewContainerDict))
        
        
        
        self.buttonLikeButton.addTarget(self, action: #selector(self.likeRepository(_:)), for: .touchUpInside)
        self.buttonDislikeButton.addTarget(self, action: #selector(self.disLikeRepository(_:)), for: .touchUpInside)
    }
    
    func populateData() {
        self.labelLanguage.text = self.manager.readLanguage()
        self.labelReposName.text = self.manager.readReposName()
        self.labelNumberOfStar.text = "\(self.manager.readNumberOfStar())"
        self.labelOwnersLoginName.text = self.manager.readOwnerLogin()
        self.labelReposCreationDate.text = self.manager.readCreatedDate()
        self.imageViewOwnerAvatar.pin_setImage(from: URL(string: self.manager.readAvatar()))
        self.updateButtonStatus()
    }
    
    func updateButtonStatus() {
        if let markedRepos = self.manager.readMarkedRepos() {
            if markedRepos.isLiked {
                self.buttonLikeButton.isSelected = true
            }
            else {
                self.buttonDislikeButton.isSelected = true
            }
        }
    }
    
    @objc func likeRepository(_ button: UIButton) {
        self.buttonDislikeButton.isSelected = false
        self.buttonLikeButton.isSelected = button.isSelected ? false : true
        self.manager.updateMarkedRepos(withStatus: button.isSelected ? true : nil)
    }
    
    @objc func disLikeRepository(_ button: UIButton) {
        self.buttonLikeButton.isSelected = false
        self.buttonDislikeButton.isSelected = button.isSelected ? false : true
        self.manager.updateMarkedRepos(withStatus: button.isSelected ? false : nil)
    }
}
