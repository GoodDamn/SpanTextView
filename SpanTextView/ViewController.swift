//
//  ViewController.swift
//  TextView
//
//  Created by GoodDamn on 24/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @objc func actionSpan(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0.0..<1.0), green: CGFloat.random(in: 0.0..<1.0), blue: CGFloat.random(in: 0.0..<1.0), alpha: 1.0);
    }

    @objc func actionSpanToWhite(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = .white;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController: viewDidLoad()");
        
        let s = 15.0;
        let scale = view.frame.height / view.frame.width;
        print("ViewController: scale:",scale, UIScreen.main.scale, view.frame.size)
        
        let textView = SpanTextView(frame: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: view.frame.width, height: s*scale)));
        
        textView.font = UIFont.systemFont(ofSize: s);
        textView.text = "Sample span text for demonstration";
        
        textView.addSpan(from: 0,
                         to: 15,
                         action: #selector(actionSpan(_:)),
                         target: self,
                         attrs: [NSAttributedString.Key.font:            UIFont.systemFont(ofSize: s),
                                 NSAttributedString.Key.foregroundColor: UIColor.red.cgColor,
                                 NSAttributedString.Key.underlineStyle:  NSUnderlineStyle.thick.rawValue,
                                 NSAttributedString.Key.underlineColor: UIColor.green]);
        
        textView.addSpan(from: 15,
                         to: textView.text.count,
                         action: #selector(actionSpanToWhite(_:)),
                         target: self,
                         attrs: [NSAttributedString.Key.font:            UIFont.systemFont(ofSize: s),
                                 NSAttributedString.Key.foregroundColor: UIColor.blue.cgColor]);
        
        
        view.addSubview(textView);
        /*
        let to = 0;
        let from = 7;
        let txt = "Simple text with subview";
        textView.text = txt;
        
        let pos1 = textView.position(from: textView.endOfDocument, offset: to);
        let pos2 = textView.position(from: textView.endOfDocument, offset: -from);
        
        let range = textView.textRange(from: pos2!, to: pos1!);
        
        var resultPos = textView.firstRect(for: range!);
        
        print("ViewController: POSITION:", resultPos);
        
        let len = txt.count;
        
        let button = UIButton(frame: resultPos);
        let start = String.Index(utf16Offset: len-from, in: txt);
        let end = String.Index(utf16Offset: len-to, in: txt);
        
        textView.text = String(txt[..<start]);
        
        button.setTitle(String(txt[start..<end]), for: .normal);
        
        button.titleLabel?.font = textView.font;
        button.backgroundColor = .blue;
        button.setTitleColor(.cyan, for: .normal);
        
        button.addTarget(self, action: #selector(actionSpan(_:)), for: .touchUpInside);
        
        textView.addSubview(button);*/
        
    }
}
