//
//  WelcomeCell.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import Lottie

class WelcomeCell: UICollectionViewCell {
    
    
    var welcomeVC: WelcomeViewController!
    var topicAnimationView = AnimationView()
    var topicLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var page: Welcome? {
        didSet {
            topicAnimationView.animation = Animation.named(page?.imageName ?? "")
            topicLabel.text = page?.topic
            descriptionLabel.text = page?.description
            if page?.topic == "Start" {
                topicAnimationView.removeFromSuperview()
                topicLabel.removeFromSuperview()
                descriptionLabel.removeFromSuperview()
            }else{
                setupAnimationView()
                setupTopicLabel()
                setupDescriptionLabel()
            }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnimationView()
        setupTopicLabel()
        setupDescriptionLabel()
        backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    private func setupAnimationView() {
    
        addSubview(topicAnimationView)
        topicAnimationView.translatesAutoresizingMaskIntoConstraints = false
        topicAnimationView.loopMode = .loop
        topicAnimationView.play()
        
        let constraints = [
            topicAnimationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topicAnimationView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(center.y/2)),
            topicAnimationView.widthAnchor.constraint(equalToConstant: 150),
            topicAnimationView.heightAnchor.constraint(equalToConstant: 150),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTopicLabel() {
        addSubview(topicLabel)
        topicLabel.translatesAutoresizingMaskIntoConstraints  = false
        topicLabel.font = UIFont(name: "Alata", size: 28)
        topicLabel.textAlignment = .center
        let constraints = [
            topicLabel.topAnchor.constraint(equalTo: topicAnimationView.bottomAnchor, constant: 16),
            topicLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
   
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Alata", size: 18)
        let constraints = [
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
