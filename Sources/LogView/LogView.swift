//
//  LogView.swift
//
//
//  Created by janlionly on 2021/9/27.
//  Copyright © 2021 janlionly<jan_ron@qq.com>. All rights reserved.
//

import UIKit

open class LogView: UIView {
    private let mainTag = 102938457
    private let textViewTag = 334598622
    private let buttonTag = 3423842
    private let button2Tag = 9281174
    private var initialCenter: CGPoint = .zero
    private var winTap: UITapGestureRecognizer? = nil
    
    public static let shared = LogView(frame: CGRect(x: 0, y: 2 * 44, width: UIScreen.main.bounds.width*3/4, height: UIScreen.main.bounds.height*3/4))
    public var isDebug: Bool = false {
        didSet {
            if isDebug {
                // Two fingers double tap for hide/show
                winTap = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
                winTap!.numberOfTapsRequired = 2
                winTap!.numberOfTouchesRequired = 2
                UIApplication.shared.keyWindow?.addGestureRecognizer(winTap!)
            } else {
                if let tap = winTap {
                    UIApplication.shared.keyWindow?.removeGestureRecognizer(tap)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textView = UITextView(frame: CGRect(x: 0, y: 34, width: frame.width, height: frame.height - 34 - 34))
        textView.isEditable = false
        textView.backgroundColor = .white.withAlphaComponent(0.82)
        textView.tag = textViewTag
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: frame.width, height: 34)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Clear Log(Pan Area)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink.withAlphaComponent(0.75)
        button.addTarget(self, action: #selector(didClear), for: .touchUpInside)
        button.tag = buttonTag
        
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 0, y: frame.height - 34, width: frame.width, height: 34)
        button2.backgroundColor = .systemPink.withAlphaComponent(0.75)
        button2.setTitle("Clear Log(Pan Area)", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button2.setTitleColor(.white, for: .normal)
        button2.addTarget(self, action: #selector(didClear), for: .touchUpInside)
        button2.tag = button2Tag
        
        self.tag = mainTag
        self.backgroundColor = .clear
        
        self.addSubview(button)
        self.addSubview(textView)
        self.addSubview(button2)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        self.addGestureRecognizer(pan)
    }
    
    open override var frame: CGRect {
        didSet {
            guard let textView = self.viewWithTag(textViewTag) else { return }
            guard let button = self.viewWithTag(buttonTag) else { return }
            guard let button2 = self.viewWithTag(button2Tag) else { return }
            
            textView.frame = CGRect(x: 0, y: 34, width: frame.width, height: frame.height - 34*2)
            button.frame = CGRect(x: 0, y: 0, width: frame.width, height: 34)
            button2.frame = CGRect(x: 0, y: frame.height-34, width: frame.width, height: 34)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func append(log logtext: String?) {
        if let v = UIApplication.shared.keyWindow {
            if let textView = v.viewWithTag(textViewTag) as? UITextView {
                var text = textView.text ?? ""
                text.append(logtext ?? "")
                textView.text = text
            }
        }
    }
    
    public func makeVisible() {
        if isDebug {
            if let v = UIApplication.shared.keyWindow {
                v.addSubview(self)
            }
        }
    }
    
    public func remove() {
        removeFromSuperview()
    }
    
    
    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            initialCenter = self.center
        case .changed:
            let translation = sender.translation(in: UIApplication.shared.keyWindow)
            self.center = CGPoint(x: initialCenter.x + translation.x,y: initialCenter.y + translation.y)
        case .cancelled:
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut]) {
                self.center = UIApplication.shared.keyWindow?.center ?? CGPoint.zero
            }
        default:
            break
        }
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer) {
        self.isHidden = !self.isHidden
        makeVisible()
    }
    
    @objc private func didClear() {
        (UIApplication.shared.keyWindow?.viewWithTag(textViewTag) as? UITextView)?.text = ""
    }
}
