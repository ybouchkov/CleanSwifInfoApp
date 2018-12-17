//
//  SnapKitView.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 14.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitView: UIView {
    
    // MARK: - Properties
    private var containerView: UIView!
    private var topView: UIView!
    private var btnView: UIView!
    private var activityIndicator: UIActivityIndicatorView!

    private let topInnerViewHeight: CGFloat = 24.0
    private let bottomInnerViewHeight: CGFloat = 36.0
    private let textfieldHeight: CGFloat = 44.0
    private let connectButtonWidth: CGFloat = 120.0
    private let containerViewHeight: CGFloat = 192.0

    private var btnConnect: UIButton!

    private var txtFieldName: UITextField!
    private var txtFieldPassword: UITextField!
    
    private var isAnimating: Bool = false
    private var timer: Timer!
    
    // MARK: - Init
    init() {
        super.init(frame: CGRect.zero)
        
        setupContainerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupContainerView()
    }
    
    // MARK: - Setup
    
    /// If the screen width is big enough this constraint will limit the container view’s width
    /// and we don’t need the other two
    /// (most probably padding will be more than 40px from the left and right edges, so they’ll be practically useless).
    /// On the other hand, if the screen width is not that big then this constraint is satisfied (width <= 500),
    /// So the left and right constraints will apply and we’ll have the minimum offset on left and right.
    private func setupContainerView() {
        containerView = UIView()
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(40).priority(750)
            make.right.equalTo(self).offset(-40).priority(750)
            make.width.lessThanOrEqualTo(500) // The view won't become more than 500px
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.height.equalTo(192)
        }
        
        setTitleView()
        setColors()
        setupNameTextField()
        setupPasswordTextField()
        setupBottomView()
        setupActivityIndicator()
    }
    
    /// Define the Top title view, which is subview for the containerView
    private func setTitleView() {
        topView = UIView()
        containerView.addSubview(topView)
        
        // Setup constraints
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            make.top.equalTo(containerView)
            make.height.equalTo(topInnerViewHeight)
        }
        
        makeLoginLabel()
    }
    
    private func makeLoginLabel() {
        let lblTitle = UILabel()
        topView.addSubview(lblTitle)
        
        lblTitle.text = "LOGIN"
        lblTitle.textColor = .white
        lblTitle.backgroundColor = .clear // no background for the label
        lblTitle.font = UIFont.montserrat(ofSize: 17.0, style: .bold)
        
        // Set constraints
        lblTitle.snp.makeConstraints { (make) in
            make.center.equalTo(topView)
        }
    }
    
    private func setColors() {
        containerView.backgroundColor = .containerViewBGColor
        containerView.layer.cornerRadius = 8.0
        containerView.clipsToBounds = true
        topView.backgroundColor = .innerViewBGColor
    }
    
    private func setupNameTextField() {
        txtFieldName = UITextField()
        txtFieldName.delegate = self
        containerView.addSubview(txtFieldName)
        
        txtFieldName.placeholder = "Username"
        txtFieldName.borderStyle = .none
        txtFieldName.backgroundColor = .white
        
        txtFieldName.keyboardType = .emailAddress
        txtFieldName.returnKeyType = .next
        txtFieldName.autocorrectionType = .no
        
        // Setup Constraints
        txtFieldName.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.left.equalTo(containerView).offset(8)
            make.right.equalTo(containerView).offset(-8)
            make.height.equalTo(textfieldHeight)
        }
    }
    
    private func setupPasswordTextField() {
        txtFieldPassword = UITextField()
        txtFieldPassword.delegate = self
        containerView.addSubview(txtFieldPassword)
        
        txtFieldPassword.placeholder = "Password"
        txtFieldPassword.borderStyle = .none
        txtFieldPassword.backgroundColor = .white
        
        txtFieldPassword.autocorrectionType = .no
        txtFieldPassword.returnKeyType = .done
        txtFieldPassword.isSecureTextEntry = true
        
        // Setup Constraints
        txtFieldPassword.snp.makeConstraints { (make) in
            make.top.equalTo(txtFieldName.snp.bottom).offset(8)
            make.left.equalTo(txtFieldName)
            make.right.equalTo(txtFieldName)
            make.height.equalTo(textfieldHeight)
        }
    }
    
    private func setupBottomView() {
        btnView = UIView()
        containerView.addSubview(btnView)
        btnView.backgroundColor = .innerViewBGColor
        
        btnView.snp.makeConstraints { (make) in
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            make.bottom.equalTo(containerView)
            make.height.equalTo(bottomInnerViewHeight)
        }
        
        makeTheFuckingButton()
    }
    
    private func makeTheFuckingButton() {
        btnConnect = UIButton()
        btnView.addSubview(btnConnect)
        
        btnConnect.setTitle("Connect", for: .normal)
        btnConnect.setTitleColor(.white, for: .normal)
        btnConnect.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        btnConnect.backgroundColor = .orange
        btnConnect.titleLabel?.font = UIFont.montserrat(ofSize: 15.0, style: .bold)
        
        btnConnect.snp.makeConstraints { (make) in
            make.top.equalTo(btnView)
            make.right.equalTo(btnView)
            make.bottom.equalTo(btnView)
            make.width.equalTo(connectButtonWidth)
        }
        
        btnConnect.addTarget(self, action: #selector(connectBtnPressed), for: .touchUpInside)
    }
    
    // MARK: - IBAction
    @objc
    func connectBtnPressed() {
        if isAnimating {
            return
        }
        
        setupAnimation()
        
        self.setNeedsLayout()
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.layoutIfNeeded()
        }, completion: { finished in
                self.didFinish(finished)
        })
        isAnimating = true
    }
    
    private func didFinish(_ finished: Bool) {
        if finished {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                              target: self,
                                              selector: #selector(self.revertLogin),
                                              userInfo: nil,
                                              repeats: false)
        }

    }
    
    /// In real case, perform a login
    @objc
    func revertLogin() {
        // Return all textFields and activity indicator to original place
        txtFieldName.snp.remakeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.left.equalTo(containerView).offset(8)
            make.right.equalTo(containerView).offset(-8)
            make.height.equalTo(textfieldHeight)
        }
        
        txtFieldPassword.snp.remakeConstraints { (make) in
            make.top.equalTo(txtFieldName.snp.bottom).offset(8.0)
            make.left.equalTo(txtFieldName)
            make.right.equalTo(txtFieldName)
            make.height.equalTo(textfieldHeight)
        }
        
        activityIndicator.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self).offset(-containerViewHeight / 2 - 20)
        }
        
        self.setNeedsLayout()
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.layoutIfNeeded()
        }, completion: { finished in
            if finished {
                self.timer.invalidate()
                self.timer = nil
                
                self.isAnimating = false
            }
        })
    }
    
    private func setupAnimation() {
        txtFieldName.snp.remakeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(16)
            make.left.equalTo(containerView.snp.right)
            make.width.equalTo(txtFieldName.snp.width)
            make.height.equalTo(textfieldHeight)
        }
        
        txtFieldPassword.snp.remakeConstraints { (make) in
            make.right.equalTo(containerView.snp.left)
            make.top.equalTo(txtFieldName.snp.bottom).offset(8)
            make.width.equalTo(txtFieldPassword.snp.width)
            make.height.equalTo(textfieldHeight)
        }
        
        activityIndicator.snp.updateConstraints { (make) in
            make.centerY.equalTo(containerView)
        }

    }
    
    /// We want the activity indicator to be placed to the center of the viewContainer view when it’s visible, therefore that makes
    /// it easy to understand that the centerX and centerY constraints are those two that we set up in order to specify its position.
    /// However, when it’s hidden, it should be positioned to the top and out of the visible area of the viewContainer view.
    /// That means we have to apply a negative offset to the centerY constraint by providing a value that ensures that
    /// the activity indicator will be fully out of any visible area.
    /// Supposing that its width and height should be 40px, let’s set its constraints up:
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        containerView.addSubview(activityIndicator)
        
        activityIndicator.backgroundColor = .orange
        activityIndicator.startAnimating()
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalTo(containerView)
            make.centerY.equalTo(containerView).offset(-containerViewHeight / 2 - 20)
            make.width.equalTo(40)
            make.height.equalTo(self.activityIndicator.snp.width)
        }
    }
}

extension SnapKitView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtFieldName {
            txtFieldPassword.becomeFirstResponder()
        } else {
            txtFieldPassword.resignFirstResponder()
        }
        
        return true
    }
}
