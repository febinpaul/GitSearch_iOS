//
//  GithubReposDetailViewController.swift
//  GithubSearch
//
//  Created by Febin Paul on 28/08/21.
//

import UIKit

class GithubReposDetailViewController: UIViewController {
    
    var manager: ReposDetailDataProtocol!
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainInfoView: UIView = {
        let view = UIView()
        return view
    }()
    
    let detailInfoView: UIView = {
        let view = UIView()
        return view
    }()
    
    let likeDislikeView: UIView = {
        let view = UIView()
        return view
    }()
    
    let stackViewMainViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    let imageViewOwnerAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.image = UIImage (named: "icon_avatar")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let labelReposName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "labelReposName"
        label.font = label.font.withSize(20)
        return label
    }()
    
    let labelLanguage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "labelLanguage"
        return label
    }()
    
    let labelNumberOfStar: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "labelNumberOfStar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageViewStar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "icon_star")
        return imageView
    }()
    
    let viewStarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackViewDetailInfoViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .leading
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    let labelOwnersLoginName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "labelOwnersLoginName"
        return label
    }()
    
    let labelReposCreationDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "labelReposCreationDate"
        return label
    }()
    
    let stackViewLikeDislikeViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    let buttonLikeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_like"), for: .normal)
        button.setImage(UIImage(named: "icon_likeSelected"), for: .selected)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return button
    }()
    
    let buttonDislikeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_dislike"), for: .normal)
        button.setImage(UIImage(named: "icon_dislikeSelected"), for: .selected)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    
    
    init(managerProtocol: ReposDetailDataProtocol) {
        self.manager = managerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.initilizeAction()
    }
    
}
