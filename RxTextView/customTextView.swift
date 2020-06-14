//
//  customTextView.swift
//  RxTextView
//
//  Created by Mac on 12.06.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

protocol customTextViewDelegate{
    func takeHTML(_ htmlCode :String)
}

class customTextView: UITextView {
    private let settingView = UIView()
    private var attributesObject = attrbs()
    private var settingViewOpenCloseStatus = false
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    func setupView(background bgColor: UIColor? = nil , textColor txtColor:UIColor? = nil , settingView:Bool? = nil){
        self.backgroundColor = .white
        self.textColor = .black
        self.layer.borderWidth = 1.0
        self.delegate = self
        self.layer.borderColor = UIColor.black.cgColor
        if let bgcolor = bgColor{
            self.backgroundColor = bgcolor
        }
        
        if let txtColor = txtColor {
            self.textColor = txtColor
        }
        if let settingView = settingView{
            if settingView == true{
                self.setSettingView()
            }
        }
        
    }
    private func setSettingView() {
        self.settingView.backgroundColor = .black
        self.settingView.frame = CGRect(x: self.frame.size.width - 80, y: self.frame.size.height - 80, width: 50, height: 50)
        self.settingView.layer.masksToBounds = true
        self.settingView.clipsToBounds = true
        self.settingView.layer.cornerRadius = settingView.frame.size.width / 2.0
        self.settingView.isUserInteractionEnabled = true
        self.settingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapView)))
        self.addSubview(self.settingView)
    }
    @objc private func tapView(){
        var frame = CGRect.zero
        if self.settingViewOpenCloseStatus == false {
            frame =  CGRect(x: self.frame.size.width - 80, y:40, width: 50, height: self.frame.size.height - 80)
        }else {
            frame = CGRect(x: self.frame.size.width - 80, y: self.frame.size.height - 80, width: 50, height: 50)
        }
        self.settingViewOpenCloseStatus = !self.settingViewOpenCloseStatus
        UIView.animate(withDuration: 1.0) {
            self.settingView.frame = frame
            self.setColorButtons()
        }
    }
    @objc func redButtonTapped(){
        if let selectedText = self.selectedTextRange{
            if let text = self.text(in: selectedText){
                let attrb = attributesObject.colorFont(string: text, color: .red)
                attributesObject.addAttribs(attrb)
                self.attributedText = attributesObject.getAttrbs()
            }
        }
    }
    @objc func blueButtonTapped(){
        if let selectedText = self.selectedTextRange{
                   if let text = self.text(in: selectedText){
                       let attrb = attributesObject.colorFont(string: text, color: .blue)
                       attributesObject.addAttribs(attrb)
                       self.attributedText = attributesObject.getAttrbs()
                   }
               }
    }
    @objc func greenButtonTapped(){
           if let selectedText = self.selectedTextRange{
                      if let text = self.text(in: selectedText){
                         let attrb = attributesObject.colorFont(string: text, color: .green)
                          attributesObject.addAttribs(attrb)
                          self.attributedText = attributesObject.getAttrbs()
                      }
                  }
    }
    @objc func boldButtonTapped(){
        if let selectedText = self.selectedTextRange{
             if let text = self.text(in: selectedText){
                let attrb = attributesObject.colorFont(string: text, color: .red, font: UIFont.boldSystemFont(ofSize: 20.0))
                    attributesObject.addAttribs(attrb)
                    self.attributedText = attributesObject.getAttrbs()
                    }
            }
       
    }
    @objc func h1ButtonTapped(){
        if let selectedText = self.selectedTextRange{
                   if let text = self.text(in: selectedText){
                      let attrb = attributesObject.colorFont(string: text, color: .black, font: UIFont(name: "Helvetica", size: 25.0))
                          attributesObject.addAttribs(attrb)
                          self.attributedText = attributesObject.getAttrbs()
                          }
                  }
       }
    @objc func h2ButtonTapped(){
        let selectedText = self.selectedRange
        if selectedText.length == 0 {
            self.font = UIFont(name: "Helvetica", size: 20.0)
        }else {
            let attribute = [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20.0)]
              self.textStorage.addAttributes(attribute as [NSAttributedString.Key : Any], range: selectedText)}
    }
    @objc func h3ButtonTapped(){
        let selectedText = self.selectedRange
        if selectedText.length == 0 {
            self.font = UIFont(name: "Helvetica", size: 15.0)
        }else {
            let attribute = [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15.0)]
              self.textStorage.addAttributes(attribute as [NSAttributedString.Key : Any], range: selectedText)}
    }
    @objc func underlineButtonTapped(){
        let selectedText = self.selectedRange
        if selectedText.length == 0 {
            self.attributedText = NSAttributedString(string: self.text, attributes:[.underlineStyle: NSUnderlineStyle.single.rawValue])
        }else {
            self.textStorage.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: selectedText)
        }
    }
    private func setColorButtons(){
        let redButton = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 100, width: 40, height: 40))
        redButton.backgroundColor = .red
        redButton.layer.masksToBounds = true
        redButton.clipsToBounds = true
        redButton.layer.cornerRadius = settingView.frame.size.width / 2.0
        redButton.addTarget(self, action: #selector(redButtonTapped), for: .touchUpInside)
        
        let blueButton = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 150, width: 40, height: 40))
        blueButton.backgroundColor = .blue
        blueButton.layer.masksToBounds = true
        blueButton.clipsToBounds = true
        blueButton.layer.cornerRadius = settingView.frame.size.width / 2.0
        blueButton.addTarget(self, action: #selector(blueButtonTapped), for: .touchUpInside)
        
        let greenButton = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 200, width: 40, height: 40))
        greenButton.backgroundColor = .green
        greenButton.layer.masksToBounds = true
        greenButton.clipsToBounds = true
        greenButton.layer.cornerRadius = settingView.frame.size.width / 2.0
        greenButton.addTarget(self, action: #selector(greenButtonTapped), for: .touchUpInside)
        
        let boldButton = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 250, width: 40, height: 40))
        boldButton.backgroundColor = .white
        boldButton.setTitle("B", for: .normal)
        boldButton.setTitleColor(.black, for: .normal)
        boldButton.layer.masksToBounds = true
        boldButton.clipsToBounds = true
        boldButton.layer.cornerRadius = settingView.frame.size.width / 2.0
        boldButton.addTarget(self, action: #selector(boldButtonTapped), for: .touchUpInside)
        
        let h1Button = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 300, width: 40, height: 40))
        h1Button.backgroundColor = .white
        h1Button.setTitle("H1", for: .normal)
        h1Button.setTitleColor(.black, for: .normal)
        h1Button.layer.masksToBounds = true
        h1Button.clipsToBounds = true
        h1Button.layer.cornerRadius = settingView.frame.size.width / 2.0
         h1Button.addTarget(self, action: #selector(h1ButtonTapped), for: .touchUpInside)
        
        let h2Button = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 350, width: 40, height: 40))
        h2Button.backgroundColor = .white
        h2Button.setTitle("H2", for: .normal)
        h2Button.setTitleColor(.black, for: .normal)
        h2Button.layer.masksToBounds = true
        h2Button.clipsToBounds = true
        h2Button.layer.cornerRadius = settingView.frame.size.width / 2.0
        h2Button.addTarget(self, action: #selector(h2ButtonTapped), for: .touchUpInside)
        
        let h3Button = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 400, width: 40, height: 40))
        h3Button.backgroundColor = .white
        h3Button.setTitle("H3", for: .normal)
        h3Button.setTitleColor(.black, for: .normal)
        h3Button.layer.masksToBounds = true
        h3Button.clipsToBounds = true
       h3Button.layer.cornerRadius = settingView.frame.size.width / 2.0
         h3Button.addTarget(self, action: #selector(h3ButtonTapped), for: .touchUpInside)
        
        let underlineButton = UIButton(frame: CGRect(x: 5, y: self.settingView.frame.size.height - 450, width: 40, height: 40))
        underlineButton.backgroundColor = .white
        underlineButton.setTitle("_", for: .normal)
        underlineButton.setTitleColor(.black, for: .normal)
        underlineButton.layer.masksToBounds = true
        underlineButton.clipsToBounds = true
        underlineButton.layer.cornerRadius = settingView.frame.size.width / 2.0
         underlineButton.addTarget(self, action: #selector(underlineButtonTapped), for: .touchUpInside)
        
        self.settingView.addSubview(underlineButton)
        self.settingView.addSubview(h3Button)
        self.settingView.addSubview(h2Button)
        self.settingView.addSubview(h1Button)
        self.settingView.addSubview(boldButton)
        self.settingView.addSubview(greenButton)
        self.settingView.addSubview(blueButton)
        self.settingView.addSubview(redButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension customTextView : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
    }
}
struct attrbs {
    private var addedAttrbs : [NSMutableAttributedString] = [NSMutableAttributedString]()
    
    mutating func addAttribs(_ attrb : NSMutableAttributedString){
        self.addedAttrbs.append(attrb)
    }
    func getAttrbs()->NSMutableAttributedString{
        let attrbsObject = NSMutableAttributedString()
        for item in self.addedAttrbs{
            attrbsObject.append(item)
        }
        
        return attrbsObject
    }
    
    func colorFont(string:String , color : UIColor, font:UIFont? = nil)->NSMutableAttributedString{
        if let isFont = font{
            let attributes : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : isFont, NSAttributedString.Key.foregroundColor : color]
            return NSMutableAttributedString(string: string , attributes: attributes)
        }
        return NSMutableAttributedString(string: string + " ", attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
