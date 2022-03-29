//
//  ToastMessage.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit

class ToastMessage: UIView {
    enum Alignment {
        case top(CGFloat)
        case bottom(CGFloat)
    }
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    private func setup() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        layer.cornerRadius = 5
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(
            x: 10,
            y: 7.5,
            width: frame.width - 20,
            height: frame.height - 15
        )
    }
    
    class func show(_ message: String, align: Alignment) {
        guard let view = UIApplication.shared.windows.filter( { $0.isKeyWindow } ).first else { return }
        let messageView = ToastMessage(frame: .zero)
        view.addSubview(messageView)
        var screen = UIScreen.main.bounds
        
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                screen = window.safeAreaLayoutGuide.layoutFrame
            }
        }
        
        let attributed = NSAttributedString(
            string: message,
            attributes: [
                .font: UIFont.systemFont(ofSize: 13)
            ]
        )
        messageView.label.attributedText = attributed
        let size = attributed.boundingRect(
            with: CGSize(width: screen.width - 110, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            context: nil
        )
        let width = size.width + 20
        let height = size.height + 15
        var yPosition: CGFloat = 0
        
        switch align {
        case let .top(padding):
            yPosition = screen.minY + padding
        case let .bottom(padding):
            yPosition = screen.minY + screen.height - height - padding
        }
        
        let initialFrame = CGRect(
            x: (screen.width - width) / 2,
            y: yPosition + 50,
            width: width,
            height: height
        )
        let targetFrame = CGRect(
            x: initialFrame.origin.x,
            y: yPosition,
            width: initialFrame.width,
            height: initialFrame.height
        )

        messageView.frame = initialFrame
        messageView.alpha = 0
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            usingSpringWithDamping: 0.35,
            initialSpringVelocity: 10,
            options: .curveEaseOut,
            animations: { [weak messageView] in
                messageView?.alpha = 1.0
                messageView?.frame = targetFrame
            },
            completion: { [weak messageView] (_) in
                UIView.animate(withDuration: 0.8, delay: 1.0, options: [], animations: {
                    messageView?.alpha = 0
                }, completion: { (_) in
                    messageView?.removeFromSuperview()
                })
            }
        )
    }
}
