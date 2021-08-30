//
//  GithubListCell.swift
//  GithubSearch
//
//  Created by Febin Paul on 27/08/21.
//

import UIKit

class GithubListCell: UITableViewCell {
    
    let labelReposName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelReposStarCount: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelLaguage: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let imageViewStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "icon_star")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(self.labelReposName)
        contentView.addSubview(self.labelReposStarCount)
        contentView.addSubview(self.labelLaguage)
        contentView.addSubview(self.imageViewStar)
        
        let viewsDict = [
            "labelReposName" : self.labelReposName,
            "labelReposStarCount" : self.labelReposStarCount,
            "labelLaguage" : self.labelLaguage,
            "imageViewStar" : self.imageViewStar,
        ] as [String : Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[labelLaguage]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[labelReposName]-20-[labelReposStarCount]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[labelReposStarCount]-5-[imageViewStar]-(>=5)-[labelLaguage]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[labelReposName]", options: [], metrics: nil, views: viewsDict))
        NSLayoutConstraint(item: self.imageViewStar, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.labelReposStarCount, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    func configCell(data: SearchRepositoryProtocol?, index: IndexPath) {
        self.labelReposName.text = data?.arrayItems[index.row].readReposName()
        self.labelReposStarCount.text = "\(data?.arrayItems[index.row].readNumberOfStar() ?? 0)"
        self.labelLaguage.text = data?.arrayItems[index.row].readLanguage()
        if let language = data?.arrayItems[index.row].readLanguage() {
            self.labelLaguage.text = !language.isEmpty ? "Language: " + language : Strings.empty
        }
        else {
            self.labelLaguage.text = Strings.empty
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
